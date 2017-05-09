require 'rails_helper'

describe "layouts/application.html.slim", type: :view do
  it "will have form with username and password field, also a submit button" do
    render
    expect(rendered).to have_selector ".header"
    expect(rendered).to have_selector ".content"
    expect(rendered).to have_selector ".footer"
  end
end
