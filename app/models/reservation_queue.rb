class ReservationQueue < ActiveRecord::Base
  before_create :set_position

  def self.updateQueue(productId)
	   rqs = where(product_id: productId).order("position ASC")
	   updates = {}
	   
	    #if there are no items in the queue, nobody has this in their cart
	   if rqs.count == 0
	       c = Cartitem.where(productid: productId).delete_all
	       
	   #if there is only one item in the queue, that item belongs in someones cart
	   elsif rqs.count == 1
	       c = Cartitem.find_or_create_by(productid: productId)
	       c.update(user_id: rqs.first.user_id)
	       
	   end
	
	   rqs.each_with_index do |rq, idx|
	       updates[rq.id] = {"position" => (idx).to_s}
	   end
	   
	   rqs.update(updates.keys, updates.values)
	   
	   
  end
  
  protected
  
	  def set_position
        ReservationQueue.transaction do
	        r = ReservationQueue.where(:product_id => self.product_id).order("position DESC")
	        r.lock
	        if r.count > 0
	          self.position = r.first.position + 1
	        else
	          self.position = 0
	          #this user gets this item in their cart!! Hooray!
	          c = Cartitem.find_or_create_by(productid: self.product_id)
	          c.update(user_id: self.user_id)
	        end
	
	    end
	 end
	 
	
	
   
end
