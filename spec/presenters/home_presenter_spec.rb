require 'spec_helper'

describe HomePresenter do
  context "#quotes" do
    before do
      create :quote, quote: "First quote"
      create :quote, quote: "Second quote"
    end

    it "will return all quotes" do
      expected_quotes = [
        "First quote",
        "Second quote",
      ]
      presenter = HomePresenter.new
      expect(presenter.quotes).to match_array(expected_quotes)
    end
  end

  context "#allow_edit_quotes?" do
    it "will return true when logged in user is owner" do
      session = {}
      session[:user] = create :employee_owner
      presenter = HomePresenter.new(session: session)
      expect(presenter.allow_edit_quotes?).to eq true
    end

    it "will return false when logged in user is not owner" do
      [:employee_supervisor, :employee_cashier].each do |employee_role|
        session = {}
        session[:user] = create employee_role
        presenter = HomePresenter.new(session: session)
        expect(presenter.allow_edit_quotes?).not_to eq true
      end
    end
  end
end
