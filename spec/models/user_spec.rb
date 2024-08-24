require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build :user }

  describe 'testing the user model' do
    it 'user is valid or not?' do
      user.valid? == true
    end
  end

  describe 'checking the assocation' do
    it 'user has many kites' do
      user = User.reflect_on_association(:kites)
      expect(user.macro).to eq(:has_many)
    end
  end

  describe 'create the user' do
    it 'should be able to create the user' do
      user = User.create!(first_name: 'kartik',
                          last_name: 'sinsinwar',
                          email: 'kartiksin@gmail.com',
                          address: 'hyd',
                          phone_number: '8218873265')
      expect(user).to be_valid
      expect(User.count).to eq(1)
    end
  end

  describe 'create the user with firstname' do
    it 'should not able to create the user without firstname' do
      user = User.create(first_name: '',
                         last_name: 'sinsinwar',
                         email: 'kartiksin@gmail.com',
                         address: 'hyd',
                         phone_number: '8218873265')
      expect(user).not_to be_valid
      expect(User.count).to eq(0)
      expect(user.errors.full_messages).to eq(["First name can't be blank"])
    end
  end

  describe 'create the user with email' do
    it 'should not able to create the user without email' do
      user = User.create(first_name: 'kartik',
                         last_name: 'sinsinwar',
                         email: '',
                         address: 'hyd',
                         phone_number: '8218873265')
      expect(user).not_to be_valid
      expect(User.count).to eq(0)
      expect(user.errors.full_messages).to eq(["Email can't be blank", 'Email is invalid'])
    end

    it 'should not able to create the user without proper email format' do
      user = User.create(first_name: 'kartik',
                         last_name: 'sinsinwar',
                         email: 'kartik@',
                         address: 'hyd',
                         phone_number: '8218873265')
      expect(user).not_to be_valid
      expect(User.count).to eq(0)
      expect(user.errors.full_messages).to eq(['Email is invalid'])
    end
  end

  describe 'create the user with phone' do
    it 'should not able to create the user without proper phone format' do
      user = User.create(first_name: 'kartik',
                         last_name: 'sinsinwar',
                         email: 'kartik@gmail.com',
                         address: 'hyd',
                         phone_number: '8218265')
      expect(user).not_to be_valid
      expect(User.count).to eq(0)
      expect(user.errors.full_messages).to eq(['Phone number must be 10 digits'])
    end

    it 'should not able to create the user without phone' do
      user = User.create(first_name: 'kartik',
                         last_name: 'sinsinwar',
                         email: 'kartik@gmail.com',
                         address: 'hyd',
                         phone_number: '')
      expect(user).not_to be_valid
      expect(User.count).to eq(0)
      expect(user.errors.full_messages).to eq(["Phone number can't be blank", 'Phone number must be 10 digits'])
    end
  end

  describe 'create the user with address' do
    it 'should not able to create the user without address' do
      user = User.create(first_name: 'kartik',
                         last_name: 'sinsinwar',
                         email: 'kartik@gmail.com',
                         address: '',
                         phone_number: '8218873262')
      expect(user).not_to be_valid
      expect(User.count).to eq(0)
      expect(user.errors.full_messages).to eq(["Address can't be blank"])
    end
  end
end
