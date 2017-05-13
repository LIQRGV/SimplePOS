class AuthPresenter < BasePresenter
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
end
