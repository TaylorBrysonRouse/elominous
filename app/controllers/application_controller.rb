class ApplicationController < ActionController::Base
  alias_method :devise_current_user, :current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def current_user
    user = devise_current_user

    customers = user.customers

    if customers.count == 1
      user.current_customer = Customer.find(customers.first.id)
    end

    user
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
