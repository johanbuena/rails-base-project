class AdminController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]
    def index
        @users = User.all

            # if @user.update(:account_status)
            #     redirect_to admin_index_path
            # else
            #   format.html { render :edit, status: :unprocessable_entity }
            #   format.json { render json: @user.errors, status: :unprocessable_entity }
            # end
    end

    def update
          if @user.update(:account_status)
                redirect_to admin_index_path
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @user.errors, status: :unprocessable_entity }
            end
      end

    private 
    def set_user
        @user = User.find(params[:id])
    end

    # def user_params
    #     params.require(:user).permit(:account_status)
    # end
end
