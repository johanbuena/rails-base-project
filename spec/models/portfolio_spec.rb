require 'rails_helper'

RSpec.describe Portfolio, type: :model do
    def build_portfolio
        user = User.new(email: 'test@test.com',
                        first_name: 'fname',
                        last_name: 'lname',
                        account_status: TRUE)
        user.password = 'pass123'
        user.save!
        user.confirm
        portfolio = user.portfolios.build(stock_name: 'Test', 
                                        price: 100.00, 
                                        shares: 15,
                                        symbol: 'tst')
        portfolio
    end

    it 'user should be saved when valid' do
        portfolio = build_portfolio
        portfolio.user_id = nil
        expect(portfolio).to_not be_valid
    end

    it 'stock_name should be saved when valid' do
        portfolio = build_portfolio
        portfolio.stock_name = nil
        expect(portfolio).to_not be_valid
    end

    it 'price should be saved when valid' do
        portfolio = build_portfolio
        portfolio.price = nil
        expect(portfolio).to_not be_valid
    end

    it 'symbol should be saved when valid' do
        portfolio = build_portfolio
        portfolio.symbol = nil
        expect(portfolio).to_not be_valid
    end

    it 'shares should be saved when valid' do
        portfolio = build_portfolio
        portfolio.shares = 0
        expect(portfolio).to_not be_valid
    end

end
