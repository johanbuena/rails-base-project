require 'rails_helper'

RSpec.describe Transaction, type: :model do

    def build_transaction
        user = User.new(email: 'test@test.com',
                        first_name: 'fname',
                        last_name: 'lname',
                        account_status: TRUE)
        user.password = 'pass123'
        user.save!
        user.confirm
        transaction = user.transactions.build(stock_name: 'AMD', 
                                                price: 100.00, 
                                                shares: 15,
                                                total_price: 1500.00,
                                                transaction_type: 'BUY')
        transaction
    end

    it 'user should be saved when valid' do
        transaction = build_transaction
        transaction.user_id = nil
        expect(transaction).to_not be_valid
    end

    it 'stock_name should be saved when valid' do
        transaction = build_transaction
        transaction.stock_name = nil
        expect(transaction).to_not be_valid
    end

    it 'price should be saved when valid' do
        transaction = build_transaction
        transaction.price = nil
        expect(transaction).to_not be_valid
    end

    it 'total_price should be saved when valid' do
        transaction = build_transaction
        transaction.total_price = nil
        expect(transaction).to_not be_valid
    end

    it 'transaction_type should be saved when valid' do
        transaction = build_transaction
        transaction.transaction_type = nil
        expect(transaction).to_not be_valid
    end

    it 'shares should be saved when valid' do
        transaction = build_transaction
        transaction.shares = 0
        expect(transaction).to_not be_valid
    end
end
