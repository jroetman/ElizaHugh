class CartitemsController < ApplicationController
  before_action :require_login
  
  
  def index
     @cartitems = current_user.cartitems
     render template: "/cartitems/show"
      
  end

  def add
      prodId = params[:id]
      
      c = Cartitem.new()
      c.productid = prodId
      c.userid = current_user.id
      c.save()
      redirect_to  :back
  
  end

  def delete 
      cart = Cartitem.find(params[:id])
      cart.destroy
      
      redirect_to "/cart"
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart

       
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:userid, :prodId)
    end
end
