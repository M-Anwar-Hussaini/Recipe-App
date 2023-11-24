require 'rails_helper'

RSpec.describe 'Food', type: :request do
  include Devise::Test::IntegrationHelpers

  let!(:user) do
    User.create(name: 'Pablo', email: 'thasipablo@gmail.com', password: '423930')
  end

  describe 'GET #index' do
    context 'when user is authenticated' do
      before do
        sign_in user
        get food_index_path
      end

      it 'returns food http success' do
        expect(response).to have_http_status(200)
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end

    context 'when user is not authenticated' do
      it 'redirects to the sign-in page' do
        get food_index_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
