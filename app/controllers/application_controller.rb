class ApplicationController < ActionController::Base
  # Strong parameters for ongs create/update.
  # Ths 'before_action' ensures a link between ongs and their custom attributes
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Check authorization for every action, unless its made by a devise model
  check_authorization :unless => :devise_controller?

  # CanCan expects a current_user method from your controller.
  # Then, I need to set an alias to say current_user = current_ong.
  def current_ability
  	@current_ability ||= Ability.new(current_ong)
	end

	# Handle 'access denied' exception redirecting the user to the home page
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :notice => exception.message
  end
	protected
		def configure_permitted_parameters
			devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation,
				:name, :description, :image_file, :site, :phone, :auxiliary_phone, :cep, :address, :complement, :uf, :city) }
		end
end
