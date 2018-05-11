class RegistrationsController < Devise::RegistrationsController
#this methods overwrites the sign_up and account_update params shipped with devise 
#to accept the name attribute

  private

  def sign_up_params
    params.require(:user).permit( :name, 
                                  :email, 
                                  :password, 
                                  :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit( :name, 
                                  :email, 
                                  :password, 
                                  :password_confirmation, 
                                  :current_password)
  end
end