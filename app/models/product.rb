class Product < ApplicationRecord
  attachment :image
  belongs_to :genre
  enum is_stopped: { 販売中: false, 売切れ: true }
end
