class Transaction < ApplicationRecord
    belongs_to :user

    validates :shares, presence: true, numericality: {greater_than: 0, only_integer: true}
end
