class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def top
    @orders = Order.all
  end
end
