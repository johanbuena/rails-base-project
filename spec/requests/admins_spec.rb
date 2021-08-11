require 'rails_helper'
require 'rspec/rails'
require 'devise'

RSpec.describe "Admins", type: :request do

    describe "GET admin#index" do
      it "should be able to get admin index page" do
        get '/admin'
        expect(response).to have_http_status(200)
      end
    end

    describe "GET admin#new" do
      it "should be able to get the user creation page" do
        get '/admin/new'
        expect(response).to have_http_status(200)
      end
    end

    describe "Admin features" do
      def create_admin
        admin = User.new(email: 'admin@admin.com',
                        first_name: 'fname',
                        last_name: 'lname',
                        account_status: TRUE)
        admin.password = 'pass123'
        admin.save!
        admin.confirm
        admin
      end

      it "should be able to create a new user" do
        account = create_admin
        sign_in account

        user_params = { user: {
          email: 'test123@email.com',
          password: '123456',
          first_name: 'test name',
          last_name: 'test last name',
          account_status: 'true',
          wallet: 0
        }}

        post '/admin/new', :params => user_params
        expect(response).to redirect_to(admin_url)
        follow_redirect!
        expect(response).to have_http_status(200)
      end

      it "should be able to edit an existing user" do
        account = create_admin
        sign_in account

        user_params = { user: {
          email: 'test123@email.com',
          password: '123456',
          first_name: 'test name',
          last_name: 'test last name',
          account_status: 'true',
          wallet: 0
        }}

        new_user_params = { user: {
          email: 'test123@email.com',
          password: '123456',
          first_name: 'test edit',
          last_name: 'test edit',
          account_status: 'true',
          wallet: 0
        }}

        user = User.create(user_params[:user])
        put "/admin/#{user.id}", :params => new_user_params
        expect(response).to redirect_to(admin_url)
        follow_redirect!
        expect(response).to have_http_status(200)
      end

      it "should be able to show all the transactions made by users" do
        account = create_admin
        sign_in account

        get "/admin"
        expect(response).to have_http_status(200)
        
      end

    end

end
