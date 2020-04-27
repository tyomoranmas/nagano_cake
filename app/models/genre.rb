class Genre < ApplicationRecord
  has_many :products
  enum is_disabled: { 有効: false, 無効: true }
  paginates_per 8

  validates :name,  presence: true, uniqueness: true
end
