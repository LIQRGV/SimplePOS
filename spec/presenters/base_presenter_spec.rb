require 'rails_helper'

describe BasePresenter do
  describe "#header_menu" do
    it "should raise error" do
      presenter = BasePresenter.new
      expect { presenter.header_menu }.to raise_error NotImplementedError
    end
  end
end
