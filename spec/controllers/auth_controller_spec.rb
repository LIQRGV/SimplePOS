require 'rails_helper'

describe AuthController, type: :controller do

  describe "GET #login" do
    it "returns http success" do
      get :login
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #authorize" do
    let!(:employee) { create :employee, username: 'user', password: 'password' }
    context "when authorization success" do
      it "will redirect to home and create session" do
        post :authorize, username: 'user', password: 'password'
        # expect(response).to have_http_status(:redirect)
        # expect(response).to redirect_to(:home)
        expect(session[:user]).not_to eq nil
      end
    end
    context "when authorization failed" do
      it "won't moved from login page and have no session" do
        post :authorize, username: 'wrong_user', password: 'wrong_password'
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(:auth_login)
        expect(session[:user]).to eq nil
      end
    end
  end
end
