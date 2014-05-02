module ReservationCartActions 
    extend ActiveSupport::Concern
    require_dependency 'assets/message'
 
   
    def added_to_cart_message(product_id, user_id)
        product = Product.find(product_id)
           
        message = Message::ItemReserved.dup
        message[:data] = message[:data].sub(/PRODUCT_TITLE/m, product.title)
        message[:data] = message[:data].sub(/PRODUCT_ID/m, product.id.to_s)
        Message.send_message(message)  
                 
    end
      
    def deleted_from_cart_message(product_id, user_id, channel)
        product = Product.find(product_id)
        message = Message::ItemAvailable.dup
        message[:data] = message[:data].sub(/PRODUCT_TITLE/m, product.title)
        message[:channel] = message[:channel].sub(/MESSAGE_CHAN/m, channel)
        Message.send_user_message(message)        
    end
    
    def update_cart_for_view(user_id)
       items = Array.new
       
       cart =  Cartitem.where(user_id: user_id).pluck(&:product_id)
       if cart
         items = cart
       end 
  
       session[:cartitems] = items.to_json
       
    end
    
end
