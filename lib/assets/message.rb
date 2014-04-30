class Message
    require 'net/http'

    ItemReserved = {:channel => "/item/added_to_cart", 
        :data => "Someone has reserved the item " +
        "<br><h4>PRODUCT_TITLE</h4>" + 
        "<p> Items are moved to the next person in line"  +
        "<br> if not purched, or cancelled, within 30 min </p>" +
        "<br> <a href='product/reserve?product_id=PRODUCT_ID' class='btn btn-default'>Be next in line </a>" 
    }
                   
    ItemAvailable = {:channel => "/item/MESSAGE_CHAN_messages", 
        :data => "PRODUCT_TITLE <br> is now in your cart " 
    }
                                  
    def self.send_message(message)
        uri = URI.parse("http://localhost:9292/faye")  
        Net::HTTP.post_form(uri, :message => message.to_json)
        
    end
    
    def self.send_user_message(message)
        uri = URI.parse("http://localhost:9292/faye") 
        Net::HTTP.post_form(uri, :message => message.to_json)
        
    end

end