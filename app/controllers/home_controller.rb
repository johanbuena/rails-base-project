class HomeController < ApplicationController
    def index
        if current_user.present?
            client = IEX::Api::Client.new(
                publishable_token: 'pk_8e835bb9a3e1499480d3372f8afb35f7',
                secret_token: 'sk_40d28152931a462c81ecdc9fe9c7268f',
                endpoint: 'https://cloud.iexapis.com/v1'
                )
            
            stocklist = ['amd',
                        'f',
                        'amc',
                        'aapl',
                        'pcg',
                        'ge',
                        'clf',
                        'uber',
                        'btbt',
                        'wish']

            @stocklist_view = []

            stocklist.each do |e|
                @stocklist_view.push(client.quote(e))
            end
        end
    end

    # def admin_logged_in
    #     if current_user.email == "admin@admin.com"
    # end
end
