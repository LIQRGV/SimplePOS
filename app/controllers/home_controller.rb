class HomeController < ApplicationController
  def home
  end

  def change_quote
    if (!session[:user].nil?) && session[:user].is_owner?
      redirect_to :home
    else
      render nothing: true, status: :unauthorized
    end
  end
end
