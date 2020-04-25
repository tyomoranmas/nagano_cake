ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def is_logged_in?
    !session[:end_user_id].nil?
  end

  def log_in(end_user)
    session[:end_user_id] = end_user.id
  end

  def log_in(end_user, password: "password", password_confirmation: "password")
    post end_user_registration_path, params: { session: { email: end_user.email,
        password: end_user.password } }
  end
end
