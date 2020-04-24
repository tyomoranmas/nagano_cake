require 'test_helper'

class EndUsers::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @end_user = EndUser.new(last_name: "Last", first_name: "First", last_name_kana: "カタ", first_name_kana: "カナ",
      email: "you@example.com", post_code: 5600000, address: "大阪府大阪市", phone_number: 58012345678, password: "password", password_confirmation: "password")
  end

  test "should get new" do
    get new_end_user_registration_path
    assert_response :success
  end

  test "should redirect when sign up" do
    post end_user_registration_path(@end_user)
    assert_redirected_to root_path
  end
end
