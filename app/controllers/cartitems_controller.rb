class CartitemsController < ApplicationController
  
  def index
     
     user_id = session[:user_id] ? session[:user_id] : session.id
     
     @cartItems = Hash.new
     items = ReservationQueue.where(user_id: user_id).collect(&:product_id)
     @cartItems["products"]   = Product.where(:id => items)
     @cartItems["cartTotal"] = @cartItems["products"].sum(:price).to_f
     @cartItems["shipping"]  = PaymentInfo.shippingCost(@cartItems["cartTotal"])
     @cartItems["estimatedTax"] = PaymentInfo.first.tax * @cartItems["cartTotal"]
     @cartItems["grandTotalMaine"] = @cartItems["cartTotal"] + @cartItems["shipping"] + @cartItems["estimatedTax"]
     @cartItems["grandTotalOut"]   = @cartItems["cartTotal"] + @cartItems["shipping"]
     
     render template: "/cartitems/show" 
  end

  def checkout
      @billingAddress = BillingAddress.new
      @shippingAddress = ShippingAddress.new
  end
  
  def charge
      #Stripe.api_key = "sk_test_lK7yQFkgDa3OUgv0YLMxaSPW"
	 

  end
  
  def complete
      user_id = session[:user_id] ? session[:user_id] : session.id

	  #update queue
      ReservationQueue.delete_all(:user_id => user_id)
      Cartitem.destroy_all(:user_id => user_id)
        	   
	  flash[:notice] = "Your purchase is complete. Thank You." 
	    
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:userid, :prodId)
    end
end
