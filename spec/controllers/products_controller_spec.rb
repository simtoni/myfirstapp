require "rails_helper"

describe ProductsController, type: :controller do
  before do
    @product = FactoryBot.create(:product)
    @user = FactoryBot.create(:user)
    @admin = FactoryBot.create(:admin)
  end

  context 'viewing products' do
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end #end index

    describe "GET #show" do
      it "renders the show product page" do
        get :show, params: {id: @product}
        expect(response).to be_ok
        expect(response).to render_template('show')
      end
    end #end show
  end #end context viewing products

  context 'admin actions' do
    describe "GET #new" do
      before do
        sign_in @admin
      end
      it "renders the new product page" do
        get :new, params: {id: @product}
        expect(response).to be_ok
        expect(response).to render_template('new')
      end
    end #end new

    describe 'GET #edit' do
      before do
        sign_in @admin
      end
      it 'renders the edit product page' do
        get :edit, params: {id: @product}
        expect(response).to be_ok
        expect(response).to render_template('edit')
      end
    end #end edit

    describe 'POST #create' do
      before do
        sign_in @admin
      end
      it 'creates a new product' do
        expect(response).to be_successful
      end
    end #end create

    describe 'DELETE #destroy' do
      before do
        sign_in @admin
      end
      it 'destroys a product' do
        delete :destroy, params: {id: @product}
        expect(response).to redirect_to products_path
      end
    end #end delete

    describe "PUT #update" do
      before do
        sign_in @admin
      end
      it "updates product" do
        delete :destroy, params: {id: @product}
        expect(response).to redirect_to products_path
      end
    end #end update
  end #end admin actions
end
