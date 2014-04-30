module CartsHelper
    
    def getCartItems
        user_id = session[:user_id] ? session[:user_id] : session.id
        items = ReservationQueue.where(user_id: user_id).collect(&:product_id)
        Product.where(:id => items)
    end
    
    def getCartTotal
       getCartItems.sum(:price)
    end
    
    def itemInCart(id)
        user_id = session[:user_id] ? session[:user_id] : session.id
        ReservationQueue.where(user_id: user_id, product_id: id).first
    end
    
    def itemInQueue(id)
       #to_s because of the serialization from json.
       user_id = session[:user_id] ? session[:user_id] : session.id
       rq = ReservationQueue.where(product_id: id)
       html = ""
       
       if rq.first
         userRes = rq.where(:user_id => user_id).first
         
         if userRes && userRes.position == 0
           html = '<a href="/cart"><span class="btn btn-default glyphicon glyphicon-shopping-cart"> </span></a> In Cart'
           
         elsif userRes
           positionDetail = "You are " + userRes.position.ordinalize + " in line"
           html = '<a href="product/cancel_reservation?product_id='+ id.to_s + '" class="btn btn-sm btn-default"> Leave </a><br>' + positionDetail
         
         else
           positionDetail = ""
           if (rq.last.position == 0)
               positionDetail = "You would be next"
           elsif (rq.last.position == 1)
               positionDetail = "There is one already" 
           else 
               positionDetail =  "There are " + rq.last.position.to_s + " already"
           end
           
           html = '<a class="btn btn-sm btn-warning addItem" href="/product/reserve?product_id='+ id.to_s + '">Get in Line!</a><br>' + positionDetail
         
         end
         
       else
    
          html = '<a class="btn btn-sm btn-info addItem" href="/product/reserve?product_id='+ id.to_s + '">Add to Cart</a>'
          
       end 
       
       html
    end
    
end
