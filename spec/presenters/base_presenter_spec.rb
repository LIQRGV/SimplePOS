require 'rails_helper'

describe BasePresenter do
  def url_helpers
    Rails.application.routes.url_helpers
  end

  describe "#header_menu" do
    it "should not raise error" do
      presenter = described_class.new
      expect { presenter.header_menu }.not_to raise_error
    end

    it "should not empty" do
      presenter = described_class.new
      url_and_text_pair = presenter.header_menu
      expect(url_and_text_pair.length > 0).to eq true
    end

    it "should contain text and url in pair" do
      presenter = described_class.new
      url_and_text_pairs = presenter.header_menu
      url_and_text_pairs.each do |pair|
        expect(pair[:url]).not_to eq nil
        expect(pair[:text]).not_to eq nil
      end
    end

    context "when user is not login yet" do
      it "will return header for non-user" do
        presenter = BasePresenter.new
        header_menu = presenter.header_menu
        expected_header = [
          {
            text: 'home',
            url: url_helpers.home_path,
          },{
            text: 'login',
            url: url_helpers.auth_login_path,
          }
        ]

        expect(header_menu).to eq expected_header
      end
    end

    context "when user is owner" do
      let(:owner) { create :employee_owner, username: 'owner', password: 'password' }
      it "will return header for owner" do
        session = {}
        session[:user] = owner
        presenter = BasePresenter.new(session: session)
        header_menu = presenter.header_menu
        expected_header = [
          {
            text: 'home',
            url: url_helpers.home_path,
          }
        ]

        expect(header_menu).to eq expected_header
      end
    end

    context "when user is supervisor" do
      let(:supervisor) { create :employee_supervisor, username: 'supervisor', password: 'password' }
      it "will return header for supervisor" do
        session = {}
        session[:user] = supervisor
        presenter = BasePresenter.new(session: session)
        header_menu = presenter.header_menu
        expected_header = [
          {
            text: 'home',
            url: url_helpers.home_path,
          }
        ]

        expect(header_menu).to eq expected_header
      end
    end

    context "when user is cashier" do
      let(:cashier) { create :employee_cashier, username: 'cashier', password: 'password' }
      it "will return header for cashier" do
        session = {}
        session[:user] = cashier
        presenter = BasePresenter.new(session: session)
        header_menu = presenter.header_menu
        expected_header = [
          {
            text: 'home',
            url: url_helpers.home_path,
          }
        ]

        expect(header_menu).to eq expected_header
      end
    end

    context "when user is not on defined role" do
      it "will return header for non-user" do
        presenter = BasePresenter.new
        header_menu = presenter.header_menu
        expected_header = [
          {
            text: 'home',
            url: url_helpers.home_path,
          },{
            text: 'login',
            url: url_helpers.auth_login_path,
          }
        ]

        expect(header_menu).to eq expected_header
      end
    end
  end
end
