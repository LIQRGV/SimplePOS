class BasePresenter
  def initialize(params: nil, session: nil, cookies: nil)
    @params = params
    @session = session
    @cookies = cookies
  end

  def header_menu
    unless @session.nil?
      user = @session[:user]
    else
      user = nil
    end

    create_header_for(user)
  end

  protected
  def url_helpers
    Rails.application.routes.url_helpers
  end

  private
  def create_header_for(user)
    headers_collection = {
      owner: [
        {
          text: 'Home',
          url: url_helpers.home_path,
        }, {
          text: 'P Umum',
          url: url_helpers.sales_path,
        }
      ],
      supervisor: [
        {
          text: 'Home',
          url: url_helpers.home_path,
        }
      ],
      cashier: [
        {
          text: 'Home',
          url: url_helpers.home_path,
        }, {
          text: 'P Umum',
          url: url_helpers.sales_path,
        }
      ],
      other: [
        {
          text: 'Home',
          url: url_helpers.home_path,
        },{
          text: 'Login',
          url: url_helpers.auth_login_path,
        }
      ]
    }

    if user.nil?
      headers_collection[:other]
    elsif user.is_owner?
      headers_collection[:owner]
    elsif user.is_supervisor?
      headers_collection[:supervisor]
    elsif user.is_cashier?
      headers_collection[:cashier]
    else
      headers_collection[:other]
    end
  end
end
