require 'rails_helper'

RSpec.describe "Transactions", type: :request do
    describe "GET /transactions" do
        def create_user
            user = User.new(email: 'test@test.com',
                            first_name: 'fname',
                            last_name: 'lname',
                            account_status: TRUE)
            user.password = 'pass123'
            user.save!
            user.confirm
            user
        end

        def create_transaction
            user = create_user
            transaction = user.transactions.create!(stock_name: 'Test',
                                                    price: 100,
                                                    shares: 10,
                                                    total_price: 1000,
                                                    transaction_type: 'SELL')
            transaction
        end

        it "show all transactions" do
            transaction = create_transaction
            sign_in transaction.user
            get transactions_path
            expect(response).to have_http_status(200)
            expect(response.body).to include(transaction.stock_name)
        end
        
        it "add a transactions" do
            user = create_user
            sign_in user
            get portfolios_path
            expect(response).to have_http_status(200)
            get buy_path("AMD")
            expect(response).to have_http_status(200)
            post transactions_path, params: {   symbol: "AMD",
                                                stock_name: "Advanced Micro Devices Inc.",
                                                price: 106.48,
                                                shares: 2
                                            }
            expect(response).to redirect_to(transactions_path)
            follow_redirect!
            expect(response.body).to include("Advanced Micro Devices Inc.")
            expect(response.body).to include("106.48")
            expect(response.body).to include("2")
        end
    end
end
