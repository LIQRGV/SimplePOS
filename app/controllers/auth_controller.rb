class AuthController < ApplicationController
  def login
    render "auth/login"
  end

  def logout
    reset_session
    redirect_to :auth_login
  end

  def authorize
    # hashing will done on client side
    username = params[:username]
    password = params[:password]

    employee = Employee.where(username: username, password: password)

    if employee.present?
      session[:user] = employee
      redirect_to :home
    else
      redirect_to :auth_login
    end
  end
end
