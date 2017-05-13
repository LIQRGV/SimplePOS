require 'rails_helper'

shared_examples "a presenter" do
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
  end
end
