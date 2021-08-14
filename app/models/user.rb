class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable

  has_many :transactions
  has_many :portfolios

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
#   validates :account_status, presence: true
end
