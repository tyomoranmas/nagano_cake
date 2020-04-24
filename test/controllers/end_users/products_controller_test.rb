require 'test_helper'

class EndUsers::ProductsControllerTest < ActionDispatch::IntegrationTest
def top
		@products = Product.all.limit(4)
		@genres = Genre.all
	end
def index
		@products = Product.page(params[:page]).reverse_order.per(8)
		@products2 = Product.all
		@genres = Genre.all
	end
 test "should get top" do
    get "/"
    assert_response :success
    assert_select "strong" ,"ようこそ、NganoCakeへ！"
  end
 test "should get index" do
    get "/end_users/products"
    assert_response :success
    assert_select 'div','paginate'
  end  
end
