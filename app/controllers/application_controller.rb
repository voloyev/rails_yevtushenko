class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_locale
  before_action :set_current_cart


  protect_from_forgery with: :exception

  private

  def set_current_cart
    session[:cart_id] ||= Cart.create.id
  end
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
end
