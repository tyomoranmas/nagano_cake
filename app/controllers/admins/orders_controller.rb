  class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders  = Order.all.order(created_at: :asc)
    @orders  = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    @order_product = OrderProduct.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    @order.update(order_params)
    @order_products.each do |order_product|
    if order_product.production_status == "製作中"
      @order.status = "製作中"
    end
    end

    if @order_products.all? do |order_product|
      order_product.production_status == "製作完了"
      end
      @order.status = "発送準備中"
    end

    if @order.status == "入金確認"
      relation_status
    end
      @order.update(order_params)
      redirect_to admins_order_path(@order)
  end

  private

    # 注文ステータスと製作ステータスを関連づけて、自動化する
    def relation_status
      @order.order_products.each do |item|
        item.production_status = "製作待ち"
        item.save
      end
    end

    def order_params
      params.require(:order).permit(:status, order_products_attributes: [:production_status, :_destroy, :id])
    end
end
