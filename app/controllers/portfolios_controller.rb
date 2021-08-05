class PortfoliosController < ApplicationController
    def index
        @client = IEX::Api::Client.new(
            publishable_token: 'pk_8e835bb9a3e1499480d3372f8afb35f7',
            secret_token: 'sk_40d28152931a462c81ecdc9fe9c7268f',
            endpoint: 'https://cloud.iexapis.com/v1'
            )

        @portfolio = Portfolio.where(user_id: current_user.id).where("shares > 0")

        stocklist = ['amd',
                'aapl',
                'msft']

        @stocklist_view = []

        stocklist.each do |e|
            @stocklist_view.push(@client.quote(e))
        end
    end

    def buy
        client = IEX::Api::Client.new(
            publishable_token: 'pk_8e835bb9a3e1499480d3372f8afb35f7',
            secret_token: 'sk_40d28152931a462c81ecdc9fe9c7268f',
            endpoint: 'https://cloud.iexapis.com/v1'
            )

        @portfolio = client.quote(params[:sym])
    end

    def update
        client = IEX::Api::Client.new(
            publishable_token: 'pk_8e835bb9a3e1499480d3372f8afb35f7',
            secret_token: 'sk_40d28152931a462c81ecdc9fe9c7268f',
            endpoint: 'https://cloud.iexapis.com/v1'
            )
        
        @new_price = client.quote(portfolio_params[:symbol]).latest_price
        @total_price = @new_price.to_f * portfolio_params[:qty_sell].to_i
        @transaction = Transaction.new(
                                    user_id: current_user.id, 
                                    stock_name: portfolio_params[:stock_name],
                                    price: @new_price,
                                    shares: portfolio_params[:qty_sell],
                                    total_price: @total_price,
                                    transaction_type: 'SELL'
                                )

        @portfolio = Portfolio.find(params[:id])
        @newShares = portfolio_params[:shares].to_i - portfolio_params[:qty_sell].to_i

        if @portfolio.update(shares: @newShares) && @transaction.save
            redirect_to transactions_path
        end 
    end

    def edit
        @portfolio = Portfolio.find(params[:id])
    end

    private

    def portfolio_params
        params.require(:portfolio).permit(:shares, :qty_sell, :symbol, :stock_name, :symbol)
    end

end
