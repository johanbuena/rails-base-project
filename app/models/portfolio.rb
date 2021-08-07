class Portfolio < ApplicationRecord
    belongs_to :user

    validates :user_id, presence: true
    validates :stock_name, presence: true
    validates :symbol, presence:true
    validates :price, presence: true
    validates :shares, presence: true, numericality: {greater_than: 0, only_integer: true}

end
