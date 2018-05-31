class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :firstname, :lastname, presence: true, format: { with: /\A[-a-zA-Z]*\z/ }

  has_one :cart
  has_many :added_items, through: :cart, dependent: :destroy

  has_many :orders, dependent: :destroy
  has_many :purchased_items, through: :orders, dependent: :destroy

end
