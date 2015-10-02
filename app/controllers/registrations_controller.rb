class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:ong).permit(:name, :description, :email, :adress, :password, :password_confirmation, :current_password)
  end

  def account_update_params
    params.require(:ong).permit(:name, :description, :email, :adress, :password, :password_confirmation, :current_password)
  end
end