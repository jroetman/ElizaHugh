require 'test_helper'

class ReservationQueuesControllerTest < ActionController::TestCase
  def setup
      @product_id = 1000;
      
      session[:user_id] = 1
      session[:cartitems] = Set.new
      
      p = Product.new
      p.id =  @product_id 
      p.price = 1
      p.description = "test"
      p.title ="test"
      p.save
      
  end

  test "should make user reservation" do
     assert_difference("ReservationQueue.count") do
       post :reserve, product_id:  @product_id 
     end
  end
  
  test "should remove user reservation" do
   
     post :reserve, product_id:  @product_id 
  
     assert_difference "ReservationQueue.count", -1 do
       post :cancel, product_id:  @product_id 
     end
     
  end
  
  
  test "product goes to next in queue" do
    product_id =  @product_id 
    post :reserve, product_id: product_id
    
    r = ReservationQueue.new(:product_id => product_id, :user_id => 66)
    r.save
  
    r = ReservationQueue.new(:product_id => product_id, :user_id => 77)
    r.save
    
    #three reservations
    assert_equal ReservationQueue.where(:product_id => product_id).first.user_id, session[:user_id] 
    post :cancel, product_id:  @product_id 
    
    assert_equal ReservationQueue.where(:product_id => product_id).first.user_id, 66 
    
  
  end
  
   #this functionality probably belongs in a model
   test "product only in one cart after reservation" do
    product_id =  @product_id
    post :reserve, product_id: product_id
    
    session[:user_id] = 2
    post :reserve, product_id: product_id
    
    session[:user_id] = 3
    post :reserve, product_id: product_id
    
    #three reservations
    assert_equal ReservationQueue.where(:product_id => @product_id).count, 3
    
    cnt = 0
    Cart.all.each do |item|
        json = JSON::parse(item.cart_json)
        if json && json.find_index(@product_id.to_s)
            cnt += 1
        end
           
    end

    assert_equal 1, cnt	
  
  end
  

end
