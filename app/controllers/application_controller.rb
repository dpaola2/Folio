class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :navigation
end
