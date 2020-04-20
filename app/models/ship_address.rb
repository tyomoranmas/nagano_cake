class ShipAddress < ApplicationRecord
  validates :post_code, format: { with: /\A\d{7}\z/ }
  validates :address, :address_name, presence: true

  belongs_to :end_user
end
