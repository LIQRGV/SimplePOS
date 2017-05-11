require 'rails_helper'

describe BasePresenter do
  describe "#access_role" do
    it "should raise error" do
      presenter = BasePresenter.new
      expect { presenter.access_role }.to raise_error NotImplementedError
    end
  end
end

shared_examples "a presenter" do
  describe "#access_role" do
    it "should not raise error" do
      presenter = described_class.new
      expect { presenter.access_role }.not_to raise_error
    end
  end
end
