require 'rails_helper'

RSpec.describe User, type: :model do
    def build_user
        user = User.new(email: 'test@test.com',
                        first_name: 'fname',
                        last_name: 'lname',
                        account_status: TRUE)
        user.password = 'pass123'
        user
    end

    it 'email should be saved when valid' do
        user = build_user
        user.email = nil
        expect(user).to_not be_valid
    end

    it 'first name should be saved when valid' do
        user = build_user
        user.first_name = nil
        expect(user).to_not be_valid
    end

    it 'last name should be saved when valid' do
        user = build_user
        user.last_name = nil
        expect(user).to_not be_valid
    end

    it 'account status should be saved when valid' do
        user = build_user
        user.account_status = nil
        expect(user).to_not be_valid
    end
end
