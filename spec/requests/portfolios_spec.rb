require "rails_helper"

RSpec.describe "Portfolios", type: :request do
  describe "GET /portfolios" do
    # it "works! (now write some real specs)" do
    #   get portfolios_index_path
    #   expect(response).to have_http_status(200)
    # end

    # it "create portfolio with valid attributes" do
    #   user = User.new(email: 'test@test.com',
    #                   first_name: 'fname',
    #                   last_name: 'lname',
    #                   account_status: TRUE)
    #                   user.password = 'pass123'
    #                   user.save!
    #                   user.confirm

    #   portfolio_params = { portfolio: {
    #     stock_name: 'Test', 
    #     price: 100.00, 
    #     shares: 15,
    #     symbol: 'tst'
    #   }}

    #   post '/portfolios', :params => portfolio_params.to_json, :headers => { "Content-Type": "application/json" }
    #   json = JSON.parse(response.body)
    #   expect(response).to have_http_status(201)
    # end

    # it 'should update the portfolio' do
    #   portfolio_params = { portfolio: {
    #     user_id: 1,
    #     stock_name: 'Test', 
    #     price: 100.00, 
    #     shares: 15,
    #     symbol: 'tst'
    #   } }

    #   new_portfolio_params = { portfolio: {
    #     user_id: 1,
    #     stock_name: 'new Test', 
    #     price: 150.00, 
    #     shares: 10,
    #     symbol: 'tst2'
    #   } }

    #   portfolio = Portfolio.create(portfolio_params(:portfolio))
    #   put '/portfolios/#{portfolio.id}', :params => new_portfolio_params
    #   expect(json["portfolio"]).to include("symbol" => "tst2")
    # end

      def create_portfolio
        user = User.new(email: 'test@test.com',
                        first_name: 'fname',
                        last_name: 'lname',
                        account_status: TRUE)
        user.password = 'pass123'
        user.save!
        user.confirm
        portfolio = user.portfolios.create!(stock_name: 'Test', 
                                        price: 100.00, 
                                        shares: 15,
                                        symbol: 'tst')
        portfolio
      end
    
      it 'show all portfolio' do
        portfolio = create_portfolio
        sign_in portfolio.user
        get portfolios_path
        expect(response).to have_http_status(200)
        expect(response.body).to include(portfolio.stock_name)
      end
    
    # end
    
  end
end
