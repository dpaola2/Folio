module ApplicationHelper
  # Mobile App Helpers
  def navigation
    @navigation = [
      {
        title: "Home", path: items_path
      },
      {
        title: "Add Item", path: new_item_path
      }
    ]
  end

  def ios_request?
    has_user_agent? && user_agent.match(/(Folio)/).present?
  end

  def user_agent
    request.env['HTTP_USER_AGENT']
  end

  def has_user_agent?
    user_agent.present?
  end

  def turbolinks_redirect(path, action: "replace")
    @redirect_path = path

    @action = action
    flash.keep
    response.headers["Turbolinks-Location"] = path
    respond_to do |format|
      format.js do
        render "layouts/turbolinks_redirect.js.erb"
      end
      format.html do
        redirect_to path
      end
    end
  end
end
