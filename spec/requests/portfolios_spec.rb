require "rails_helper"

RSpec.describe "Portfolios", type: :request do
    describe "GET /portfolios" do
        def create_user
            user = User.new(    email: 'test@test.com',
                                first_name: 'fname',
                                last_name: 'lname',
                                account_status: TRUE
                            )
            user.password = 'pass123'
            user.save!
            user.confirm
            user
        end

        def create_portfolio
            user = create_user
            portfolio = user.portfolios.create!(    stock_name: 'Test', 
                                                    price: 100.00, 
                                                    shares: 15,
                                                    symbol: 'tst'
                                                )
            portfolio
        end

        it 'show all portfolio' do
            portfolio = create_portfolio
            sign_in portfolio.user
            get portfolios_path
            expect(response).to have_http_status(200)
            expect(response.body).to include(portfolio.stock_name)
        end

        it "add a portfolio" do
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
            get portfolios_path
            expect(response.body).to include("Advanced Micro Devices Inc.")
            expect(response.body).to include("106.48")
            expect(response.body).to include("2")
            expect(response.body).to include("AMD")
        end

        it "sell a portfolio" do
            user = create_user
            sign_in user
            get portfolios_path
            expect(response).to have_http_status(200)
            get buy_path("AMD")
            expect(response).to have_http_status(200)
            post transactions_path, params: {   symbol: "AMD",
                                                stock_name: "Advanced Micro Devices Inc.",
                                                price: 106.48,
                                                shares: 70
                                            }
            expect(response).to redirect_to(transactions_path)
            follow_redirect!
            get portfolios_path
            expect(response).to have_http_status(200)
            get edit_portfolio_path(user.portfolios.first)
            expect(response).to have_http_status(200)
            put portfolio_path, params: {  portfolio:   {   symbol: "AMD",
                                                            stock_name: "Advanced Micro Devices Inc.",
                                                            price: 106.48,
                                                            shares: 70,
                                                            qty_sell: 21
                                                        }
                                        }
            expect(response).to redirect_to(transactions_path)
            follow_redirect!
            get portfolios_path
            expect(response.body).to include("Advanced Micro Devices Inc.")
            expect(response.body).to include("106.48")
            expect(response.body).to include("49")
            expect(response.body).to include("AMD")
        end
    end
end
