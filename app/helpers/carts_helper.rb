module CartsHelper

    def itemInCart(id)
        user_id = session[:user_id] ? session[:user_id] : session.id
        ReservationQueue.where(user_id: user_id, product_id: id).first
    end
    
    def itemCount()
        user_id = session[:user_id] ? session[:user_id] : session.id
        ReservationQueue.where(user_id: user_id).count()
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
    
    def us_states
    [
    ['',''],
    ['AK', 'AK'],
    ['AL', 'AL'],
    ['AR', 'AR'],
    ['AZ', 'AZ'],
    ['CA', 'CA'],
    ['CO', 'CO'],
    ['CT', 'CT'],
    ['DC', 'DC'],
    ['DE', 'DE'],
    ['FL', 'FL'],
    ['GA', 'GA'],
    ['HI', 'HI'],
    ['IA', 'IA'],
    ['ID', 'ID'],
    ['IL', 'IL'],
    ['IN', 'IN'],
    ['KS', 'KS'],
    ['KY', 'KY'],
    ['LA', 'LA'],
    ['MA', 'MA'],
    ['MD', 'MD'],
    ['ME', 'ME'],
    ['MI', 'MI'],
    ['MN', 'MN'],
    ['MO', 'MO'],
    ['MS', 'MS'],
    ['MT', 'MT'],
    ['NC', 'NC'],
    ['ND', 'ND'],
    ['NE', 'NE'],
    ['NH', 'NH'],
    ['NJ', 'NJ'],
    ['NM', 'NM'],
    ['NV', 'NV'],
    ['NY', 'NY'],
    ['OH', 'OH'],
    ['OK', 'OK'],
    ['OR', 'OR'],
    ['PA', 'PA'],
    ['RI', 'RI'],
    ['SC', 'SC'],
    ['SD', 'SD'],
    ['TN', 'TN'],
    ['TX', 'TX'],
    ['UT', 'UT'],
    ['VA', 'VA'],
    ['VT', 'VT'],
    ['WA', 'WA'],
    ['WI', 'WI'],
    ['WV', 'WV'],
    ['WY', 'WY']
    ]
    end
    
end
