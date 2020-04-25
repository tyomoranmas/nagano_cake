require 'test_helper'

class Admins::ProductsControllerTest < ActionDispatch::IntegrationTest

  #def setup
    #@product = Product.new(genre_id: "1", name: "美味ケーキ", introduction: "絶品です")
  #end

  test "should get new" do
    get "/admins/products/new"
    assert_response :success
  end

  #test "should redirect when create" do
   #post admins_products_path(@product)
    #assert_redirected_to admins_product_path(product.id)
  #end
end

