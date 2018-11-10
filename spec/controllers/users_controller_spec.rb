require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  describe 'POST #create' do
    it 'creates a new user' do
      post :create, params: { user: attributes_for(:user) }
      expect(User.count).to eq(1)
    end
  end

  describe 'PUT #update' do
    it 'returns the user' do
      user
      put :update, params: { id: user.id, user: attributes_for(:user, email: 'test@test.com') }
      expect(User.find(user.id).email).to eq('test@test.com')
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the user' do
      user
      delete :destroy, params: { id: user.id }
      expect(User.count).to eq(0)
    end
  end
end