require 'rails_helper'

describe "home/home.html.slim", type: :view do
  let(:quotes) { ["Some wise word here"] }
  let(:no_quotes) { [] }
  let(:presenter_without_quotes_and_allowed_to_edit) { instance_double('PresenterWithoutQuotes', quotes: no_quotes, allow_edit_quotes?: true) }
  let(:presenter_without_quotes_and_not_allowed_to_edit) { instance_double('PresenterWithoutQuotes', quotes: no_quotes, allow_edit_quotes?: false) }
  let(:presenter_with_quotes_and_allowed_to_edit) { instance_double('PresenterWithoutQuotes', quotes: quotes, allow_edit_quotes?: true) }
  let(:presenter_with_quotes_and_not_allowed_to_edit) { instance_double('PresenterWithoutQuotes', quotes: quotes, allow_edit_quotes?: false) }

  it "will have welcoming word" do
    assign(:presenter, presenter_without_quotes_and_not_allowed_to_edit)
    render
    expect(rendered).to have_content "Selamat Datang"
  end

  context "with quotes" do
    let(:selected_presenter) { presenter_with_quotes_and_not_allowed_to_edit }
    before do
      assign(:presenter, selected_presenter)
      render
    end

    it "will show all quotes" do
      expect(rendered).to have_content("Some wise word here")
    end

    context "also allowed to edit quotes" do
      let(:selected_presenter) { presenter_with_quotes_and_allowed_to_edit }
      it "will show the edit form" do
        expect(rendered).to have_selector("form input[type='submit']")
        expect(rendered).to have_selector("form textarea")
      end
    end

    context "also not allowed to edit quotes" do
      let(:selected_presenter) { presenter_with_quotes_and_not_allowed_to_edit }
      it "won't show the edit form" do
        expect(rendered).not_to have_selector("form input[type='submit']")
        expect(rendered).not_to have_selector("form textarea")
      end
    end
  end

  context "without quotes" do
    let(:selected_presenter) { presenter_without_quotes_and_not_allowed_to_edit }
    before do
      assign(:presenter, selected_presenter)
      render
    end

    it "will show any quotes" do
      # still have no idea how to test this,
      # since the quote have no tag or anything to pinpoint
      expect(rendered).not_to have_content("Some wise word here")
    end

    context "also allowed to edit quotes" do
      let(:selected_presenter) { presenter_without_quotes_and_allowed_to_edit }
      it "will show the edit form without any textarea to edit" do
        expect(rendered).to have_selector("form input[type='submit']")
        expect(rendered).not_to have_selector("form textarea")
      end
    end

    context "also not allowed to edit quotes" do
      let(:selected_presenter) { presenter_without_quotes_and_not_allowed_to_edit }
      it "won't show the edit form" do
        expect(rendered).not_to have_selector("form input[type='submit']")
        expect(rendered).not_to have_selector("form textarea")
      end
    end

  end
end

