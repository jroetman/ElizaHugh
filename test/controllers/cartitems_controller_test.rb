require 'test_helper'

class CartitemsControllerTest < ActionController::TestCase

  setup do
     p = PaymentInfo.new(vendor: "test", tax: 0.05, shipping: 10)
     p.save
  end
  
  test "should get index" do
    get :index
    assert_response :success

  end

end
