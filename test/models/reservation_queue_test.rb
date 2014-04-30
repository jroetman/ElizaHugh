require 'test_helper'

class ReservationQueueTest < ActiveSupport::TestCase
  test "reservation position" do
    product_id = 1
    user_id = 55 

    r = ReservationQueue.new(:product_id => product_id, :user_id => user_id)
    r.save
    assert_equal 0, ReservationQueue.where(:product_id => product_id, :user_id => user_id).first.position

  end
  test "reservation positions" do
    product_id = 1
    user_id = 55 

    r = ReservationQueue.new(:product_id => 1, :user_id => 66)
    r.save

    r = ReservationQueue.new(:product_id => 1, :user_id => 77)
    r.save

    r = ReservationQueue.new(:product_id => 1, :user_id => 88)
    r.save
    
    r = ReservationQueue.new(:product_id => 1, :user_id => 100)
    r.save

    assert_equal 1, ReservationQueue.where(:product_id => 1, :user_id => 77).first.position
    assert_equal 2, ReservationQueue.where(:product_id => 1, :user_id => 88).first.position
    assert_equal 3, ReservationQueue.where(:product_id => 1, :user_id => 100).first.position
    
    assert_equal 1, ReservationQueue.where(:product_id => 1, :user_id => 88).count
    

  end
  
   
end
