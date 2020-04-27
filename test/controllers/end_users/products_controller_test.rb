require 'test_helper'

class EndUsers::ProductsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @product = products(:cake)
  end
 test "should get top" do
    get "/"
    assert_response :success
    assert_select "strong" ,"ようこそ、NganoCakeへ！"
  end
 test "should get index" do
    get "/end_users/products"
    assert_response :success
  end
 test "should get show" do
    get "/end_users/products/#{@products}"
    assert_response :success
  end
end
