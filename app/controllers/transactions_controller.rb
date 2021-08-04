class TransactionsController < ApplicationController
    def index
        @transaction = Transaction.where(user_id: current_user.id)
    end

    def create
        @total_price = purchase_params[:shares].to_i * purchase_params[:price].to_f
        @portfolio = Portfolio.new(purchase_params.merge(user_id: current_user.id))
        @transaction = Transaction.new(transaction_params.merge(user_id: current_user.id, transaction_type: 'BUY', total_price: @total_price))
        if @portfolio.save && @transaction.save
            redirect_to transactions_path
        end
    end
    
    private

    def purchase_params
        params.permit(:symbol, :stock_name, :price, :shares)
    end

    def transaction_params
        params.permit(:stock_name, :price, :shares)
    end
end
