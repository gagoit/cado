class ApplicationController < ActionController::Base
  #before_filter :authenticate_user!, :except => [:show, :index]
  protect_from_forgery
  layout "new_layout"

  check_authorization :unless => :devise_controller?

  before_filter :authenticate_request

  rescue_from ActionController::RoutingError, :with => :render_routing_fail
  rescue_from AbstractController::ActionNotFound, :with => :render_not_found
  rescue_from Mongoid::Errors::DocumentNotFound, :with => :render_not_found
  #rescue_from ::BSON::InvalidObjectId, :with => :render_bad_request
  rescue_from CanCan::AccessDenied, :with => :render_access_denied

  protected

  def authenticate_request
    authenticate_user!
  end

  def render_access_denied
    session[:login_next] = request.path
    render_message :access_denied, root_url
  end

  def render_not_found
    render_message :not_found
  end

  def render_bad_request
    render_message :bad_request
  end

  def render_routing_fail
    render_message :routing_fail
  end

  def render_message(key, path = root_url, opts = {})
    msg = { :alert => t("error.#{key}") }
    code = case key
    when :access_denied then 401
    when :not_found, :routing_fail then 404
    when :bad_request then 400
    end

    respond_to do |format|
      format.html { redirect_to path, msg }
      format.pdf  { redirect_to path, msg }

      format.json { render :status => code, :json => msg, :callback => params[:callback] }
      format.xml  { render :status => code, :xml => msg }
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    if session[:login_next]
      session.delete(:login_next)
    else
      super
    end
  end

  def self.reset_respond_to
    self.mimes_for_respond_to = {}
  end

  def with_format(format, &block)
    old_formats = formats
    self.formats = [format]
    block.call
    self.formats = old_formats
    nil
  end
end
