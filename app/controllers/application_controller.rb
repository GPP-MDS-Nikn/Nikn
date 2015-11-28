class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	# Strong parameters for ongs create/update.
	# The 'before_action' ensures a link between ongs and their custom attributes
	before_action :configure_permitted_parameters, if: :devise_controller?
	protected
		def configure_permitted_parameters
			devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, 
				:name, :description, :image_file, :site, :phone, :auxiliary_phone, :cep, :address, :complement, :uf, 
				:city) }
			devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation,
				:current_password, :name, :description, :image_file, :site, :phone, :auxiliary_phone, :cep, 
				:address, :complement, :uf, :city) }
		end
end
