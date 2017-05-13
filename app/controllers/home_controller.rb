class HomeController < ApplicationController
  def home
    render nothing: true
  end

  def change_quote
    if session[:user].is_owner?
      redirect_to :home
    else
      render nothing: true, status: :unauthorized
    end
  end
end
