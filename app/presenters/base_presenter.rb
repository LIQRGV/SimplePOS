class BasePresenter
  def header_menu
    raise NotImplementedError
  end

  protected
  def url_helpers
    Rails.application.routes.url_helpers
  end
end
