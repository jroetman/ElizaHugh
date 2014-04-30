class ReservationQueuesController < ApplicationController
   include ReservationCartActions
   
   def reserve
      user_id = session[:user_id] ? session[:user_id] : session.id
      product_id = params[:product_id]
      
        
      r = ReservationQueue.new(:product_id => product_id, :user_id => user_id, :message_channel => message_channel)
      r.save
      
      #Let people know this item is being considered
      if r.position == 0
          added_to_cart_message(r.product_id, user_id)
      end
      
      update_cart_for_view(user_id)
      
      redirect_to :back
            
   end
   
   def cancel
      user_id = session[:user_id] ? session[:user_id] : session.id
      product_id = params[:product_id]
      
      rqs = ReservationQueue.where(:product_id => product_id).order("position ASC")
      userRes = rqs.where(user_id: user_id).first
      nextRes = rqs.where(position: 1).first

      if (userRes)
          if userRes.position == 0 && nextRes
              deleted_from_cart_message(product_id, user_id, nextRes.message_channel)
          end
          
		  userRes.delete
          ReservationQueue.updateQueue(product_id)		
      end
      update_cart_for_view(user_id)
      
      redirect_to :back     
   end
      
end
