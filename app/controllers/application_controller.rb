class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?

    after_action :verify_authorized, except: :index, unless: :skip_pundit?
    after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birthday, :city, :email, :password, :position, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :birthday, :city, :email, :password, :position, :photo])
  end

  def default_url_options
    { host: ENV["www.balrsport.com"] || "localhost:3000" }
  end
end
