require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET /index' do
    it 'should get the index' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'get new' do
    it 'should get new' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'get edit' do
    it 'should get edit' do
      get :edit, params: { id: user.id }
      expect(response).to be_successful
    end
  end

  describe 'get update' do
    it 'get update the fields' do
      patch :update, params: { id: user.id, user: { first_name: 'viajy' } }
      expect(response).to have_http_status '302'
    end
  end

  describe 'get create' do
    it 'able to create' do
      post :create, params: { user: { first_name: 'harit', last_name: 'chaudhary', email: 'haritc@gmail.com', phone_number: '8957462486', address: 'noida' } }
      expect(response).to have_http_status '302'
    end
  end

  describe 'get destroy' do
    it 'able to destroy' do
      delete :destroy, params: { id: user }
      expect(User.count).to eq(0)
    end
  end
end
