module CartsHelper

    def getCartItems
        items = session[:cartitems].to_a
        Product.where(:id => items)
    end
    
    def getCartTotal
       getCartItems.sum(:price)
    end
    
    def itemInCart(id)
       #to_s because of the serialization from json.
       session[:cartitems].include?(id.to_s)
    end
    
end
