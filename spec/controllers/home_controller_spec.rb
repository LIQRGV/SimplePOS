
describe HomeController, type: :controller do
  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #change_quote" do
    let(:owner) { create :employee_owner, username: 'owner', password: 'password' }
    let(:supervisor) { create :employee_supervisor, username: 'supervisor', password: 'password' }
    let(:cashier) { create :employee_cashier, username: 'cashier', password: 'password' }

    context "when user is owner" do
      it "will accept quote post" do
        session[:user] = owner
        post :change_quote, quote: 'some quote here'
        expect(response).not_to have_http_status(:unauthorized)
      end
    end
    context "when user is not owner" do
      it "won't accept quote post" do
        [supervisor, cashier, nil].each do |role|
          session[:user] = role
          post :change_quote, quote: 'some quote here'
          expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end
end
