class HomeController < ApplicationController
    before_action :user_or_admin
    def index
        
    end

    def user_or_admin
        if current_user.present? && current_user.email == "admin@admin.com"
            redirect_to admin_index_path
        end
    end
end
