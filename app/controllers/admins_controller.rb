class AdminsController < ApplicationController
  def top
    @orders = Order.all
  end
end
