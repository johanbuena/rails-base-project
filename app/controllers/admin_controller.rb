class AdminController < ApplicationController
    def index
        @users = User.all
        @transactions = Transaction.all
        
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            redirect_to admin_path
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to admin_path
        end
    end

    def approve
        @user = User.find(params[:id])

        if AdminMailer.account_approve(@user).deliver
            @user.update_attributes(:account_status => "true")
            redirect_to admin_path
        end
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :account_status, :wallet, :confirmed_at, :password, :password_confirmation)
    end

    def update_user_params
        params.require(:user).permit(:first_name, :last_name, :email)
    end
end
