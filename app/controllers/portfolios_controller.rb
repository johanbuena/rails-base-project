class PortfoliosController < ApplicationController
    def index
        @portfolio = Portfolio.where(user_id: current_user.id)

        client = IEX::Api::Client.new(
            publishable_token: 'pk_8e835bb9a3e1499480d3372f8afb35f7',
            secret_token: 'sk_40d28152931a462c81ecdc9fe9c7268f',
            endpoint: 'https://cloud.iexapis.com/v1'
            )

        stocklist = ['amd',
                'aapl',
                'msft']

        @stocklist_view = []

        stocklist.each do |e|
            @stocklist_view.push(client.quote(e))
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

    def add
        
    end

    private

    def purchase_params
      params.require(:portfolio).permit(:company_name)
    end

end
