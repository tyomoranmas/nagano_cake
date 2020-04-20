class EndUsers::ShipAddressesController < ApplicationController
  before_action :set_current_end_user

  def index
    @ship_address = ShipAddress.new
    @ship_addresses = @end_user.ship_addresses
  end

  def create
    @ship_address = ShipAddress.new(ship_address_params)
    @ship_address.end_user_id = @end_user.id
    if @ship_address.save
      redirect_to end_users_ship_addresses_path
    else
      @ship_addresses = @end_user.ship_addresses
      render :index
    end
  end

  def edit
    @ship_address = ShipAddress.find(params[:id])
  end

  def update
    @ship_address = ShipAddress.find(params[:id])
    if @ship_address.update(ship_address_params)
      redirect_to end_users_ship_addresses_path, success: "配送先を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @ship_address = ShipAddress.find(params[:id])
    @ship_address.destroy
    redirect_to end_users_ship_addresses_path, success: "配送先を削除しました"
  end

  private
    def ship_address_params
      params.require(:ship_address).permit(:address, :post_code, :address_name)
    end
end
