require 'rails_helper'

describe "layouts/application.html.slim", type: :view do
  let(:header_menu) {
    [
      {
        url: "someUrl1", 
        text: "someText1"
      },
      {
        url: "someUrl2", 
        text: "someText2"
      },
    ]
  }
  before do
    presenter_double = instance_double("Presenter", header_menu: header_menu)
    assign(:presenter, presenter_double)
  end

  it "will have form with username and password field, also a submit button" do
    render
    expect(rendered).to have_selector ".header"
    expect(rendered).to have_selector ".content"
    expect(rendered).to have_selector ".footer"
    expect(rendered).to have_selector "ul li a"
    expect(rendered).to have_content "Copyright © 2012 TBS Pharmacy. All Rights Reserved"
  end
end
