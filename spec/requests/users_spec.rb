require 'rails_helper'
require 'rspec/rails'


RSpec.describe "Users", type: :request do

    describe "GET home#index" do
      it "should get index" do
        get '/'
        expect(response).to have_http_status(200)
      end
    end

    describe "GET devise/registrations#new" do
      it "should get registration page" do
        get '/users/sign_up'
        expect(response).to have_http_status(200)
      end
    end

    describe "POST devise/registrations#create" do
      it "should register a user" do
        user_params = { user: {
          email: 'test123@email.com',
          password: '123456',
          first_name: 'test name',
          last_name: 'test last name',
          account_status: 'false',
          wallet: 0
        }}

        post '/users', :params => user_params
        expect(response).to have_http_status(200)
      end
    end

    describe "GET devise/sessions#new" do
      it "should get login page" do
        get '/users/sign_in'
        expect(response).to have_http_status(200)
      end
    end

    describe "POST devise/sessions#create" do
      it "should be able to login the user" do
        user_params = { user: {
          email: 'test123@email.com',
          password: '123456'
        }}
        
        post '/users/sign_in', :params => user_params
        expect(response).to have_http_status(200)
      end
    end

end
