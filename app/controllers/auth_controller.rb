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
    employee_params = params[:employee]
    username = employee_params[:username]
    password = employee_params[:password]

    employee = Employee.where(username: username, password: password).first

    if employee.present?
      serializable_employee = employee.serializable_hash
      serializable_employee["stringified_roles"] = employee.stringify_roles
      serializable_employee["is_owner?"] = employee.is_owner?
      serializable_employee["is_supervisor?"] = employee.is_supervisor?
      serializable_employee["is_cashier?"] = employee.is_cashier?
      session[:user] = serializable_employee
      redirect_to :home
    else
      redirect_to :auth_login
    end
  end
end
