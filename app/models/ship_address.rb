class ShipAddress < ApplicationRecord
  validates :post_code, format: { with: /\A\d{7}\z/ }
  validates :address, :address_name, presence: true

  belongs_to :end_user

  def addressee
    '〒 ' +	post_code + '　' +  address + '　' +  address_name
  end
end
