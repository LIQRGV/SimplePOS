class HomePresenter < BasePresenter
  def initialize(params: params, session: session, cookies: cookies)
    @params = params
    @session = session
    @cookies = cookies
  end

  def header_menu
    [
      {
        text: 'home',
        url: url_helpers.home_path,
      },{
        text: 'login',
        url: url_helpers.auth_login_path,
      }
    ]
  end

  def quotes

  end

  def allow_edit_quotes?
    user = @session[:user]
    user.is_owner?
  end
end

