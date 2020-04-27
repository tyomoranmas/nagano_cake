require 'test_helper'

class EndUsers::OrdersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @end_user = end_users(:end_user)
    @order = orders(:order)
  end

  #test "should render confirm when post order" do
    #get new_end_users_order_path
    #log_in(@end_user)
    #post end_users_confirm_order_path, params: { order: { end_user_id: 1, post_code: 5600012,
        #address_name: "name", address: "address", payment: "クレジットカード", add: 2 } }
    #assert_template 'end_users/orders/confirm'
  #end

  #test "should redirect finish page when post order" do
    # post end_users_orders_path(@order)
    # assert @order.valid?
  #end
end
