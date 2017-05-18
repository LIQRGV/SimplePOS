class HomePresenter < BasePresenter
  def quotes
    Quote.pluck(:quote)
  end

  def allow_edit_quotes?
    user = @session[:user]
    user.is_owner?
  end
end

