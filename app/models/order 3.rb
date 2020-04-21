class Order < ApplicationRecord
  belongs_to :end_user

  enum payment: { クレジットカード: 0, 銀行振込: 1 }
end
