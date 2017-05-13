
describe HomeController, type: :controller do
  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #change_quote" do
    let(:owner) do
      employee = create :employee, username: 'owner', password: 'password'
      role = create :role_owner
      role.save
      employee.role = [role]
      employee.save
      Employee.find(employee.id)
    end

    let(:supervisor) do
      employee = create :employee, username: 'supervisor', password: 'password'
      role = create :role_supervisor
      role.save
      employee.role = [role]
      employee.save
      Employee.find(employee.id)
    end

    let(:cashier) do
      employee = create :employee, username: 'cashier', password: 'password'
      role = create :role_cashier
      role.save
      employee.role = [role]
      employee.save
      Employee.find(employee.id)
    end

    context "when user is owner" do
      it "will accept quote post" do
        session[:user] = owner
        post :change_quote, quote: 'some quote here'
        expect(response).not_to have_http_status(:unauthorized)
      end
    end
    context "when user is not owner" do
      it "won't accept quote post" do
        [supervisor, cashier].each do |role|
          session[:user] = role
          post :change_quote, quote: 'some quote here'
          expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end
end
