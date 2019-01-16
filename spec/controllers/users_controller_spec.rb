require 'rails_helper'

describe UsersController, type: :controller do

  let(:user) { User.create!(email: 'test1@example.com', password: 'test123') }
  let(:user2) { User.create!(email: 'test2@example.com', password: 'test456') }

  describe 'GET #show' do

    context 'when a user is logged in' do
      before do
        sign_in user
      end

      it "loads correct user details" do
        get :show, params: { id: user.id }
        expect(response).to be_ok
        expect(assigns(:user)).to eq user
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to root_path' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
