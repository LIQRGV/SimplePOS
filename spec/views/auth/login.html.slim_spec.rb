require 'rails_helper'

describe "auth/login.html.slim", type: :view do
  it "will have form with username and password field, also a submit button" do
    render
    expect(rendered).to have_selector "input[name='employee[username]']"
    expect(rendered).to have_selector "input[name='employee[password]']"
    expect(rendered).to have_selector "input[type='submit']"
  end
end
