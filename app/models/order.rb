class Order < ApplicationRecord
  has_many :order_products

  belongs_to :end_user

  enum payment: { クレジットカード: 0, 銀行振込: 1 }
  enum status: { 入金待ち: 0, 入金確認: 1,
                製作中: 2, 発送準備中: 3, 発送済み: 4 }
  enum production_status: { 着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3}, _prefix: true
  def sum
    sum = 0
    order_products.each do |item|
      sum += (item.tax_included_price * item.quantity)
    end
    sum
  end

  validates :address_name, :address, presence: true
  validates :post_code, format: { with: /\A\d{7}\z/ }
end
