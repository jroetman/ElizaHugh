class CartitemsController < ApplicationController
  
  def index
     render template: "/cartitems/show"
      
  end

  def add
      prodId = params[:id]
      #I chose to serialize cartitems to json in the database. 
      #Adding items as a string makes it consistent when deserializing.
      session[:cartitems] << prodId.to_s
      
      update_cart
      
      redirect_to :back
      
  end
  

  def delete 
      id = params[:id]
      idxMap = Hash[session[:cartitems].map.with_index.to_a]
      idx = idxMap[id]
      
      session[:cartitems].delete_at(idx)
      
      update_cart
      
      redirect_to "/cart"
  end
  
  def checkout
      @billingAddress = BillingAddress.new
      @shippingAddress = ShippingAddress.new
  end
  
  def charge
  
      Stripe.api_key = "sk_test_lK7yQFkgDa3OUgv0YLMxaSPW"
	
      # Get the credit card details submitted by the form
      token = params[:stripeToken]
	
      # Create the charge on Stripe's servers - this will charge the user's card
      begin
	    charge = Stripe::Charge.create(
	    :amount => (current_user.cart_total * 100).to_i, # amount in cents, again
	    :currency => "usd",
	    :card => token,
	    :description => "Eliza Hugh purchase."
	   )
	   
	    flash[:notice] = "Your purchase is complete. Thank You." 
        current_user.cartitems.destroy
        Cartitem.destroy_all(:userid => current_user.id)
        
      rescue => e
        flash[:notice] = "There was an error: " + e.to_s;
        
  	  end
  	  
  	  redirect_to "/cart/complete"

  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def update_cart
      if session[:user_id]
	      cart = Cart.find_or_create_by_user_id(session[:user_id]);
	      cart.cart_json = session[:cartitems].to_json
	      cart.save
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:userid, :prodId)
    end
end
