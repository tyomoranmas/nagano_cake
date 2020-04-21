class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

 belongs_to :admin
 has_many :ship_addresses, dependent: :destroy
 has_many :order, dependent: :destroy
 has_many :cart_items, dependent: :destroy



  validates :last_name, :first_name, :address, presence: true
  validates :last_name_kana, :first_name_kana,  presence: true,
    format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力してください。'}
  validates :post_code, format: { with: /\A\d{7}\z/ }
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }

end