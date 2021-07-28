class HomeController < ApplicationController
    def index

        @client = IEX::Api::Client.new(
            publishable_token: 'pk_8e835bb9a3e1499480d3372f8afb35f7',
            secret_token: 'sk_40d28152931a462c81ecdc9fe9c7268f',
            endpoint: 'https://cloud.iexapis.com/v1'
            )
        
    end
end
