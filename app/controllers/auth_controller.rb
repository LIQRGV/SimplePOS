class AuthController < ApplicationController
  def login
    render "auth/login"
  end

  def authorize
    render nothing: true, status: :found
  end
end
