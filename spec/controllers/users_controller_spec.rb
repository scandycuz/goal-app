require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #new' do
    it 'renders the new user page' do
      get :new

      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do

    context 'with invalid params' do

      it 'validates presence of valid username and password' do
        post :create, user: {username: nil, password: "34"}
        expect(response).to render_template("new")
        expect(flash[:errors]).to include("Username can't be blank")
        expect(flash[:errors]).to include("Password is too short (minimum is 6 characters)")
      end
    end

    context 'with valid params' do

      it 'redirects to user page' do
        post :create, user: {username: 'user', password: 'password'}
        expect(response).to redirect_to user_url(User.last)
      end

    end

  end

end
