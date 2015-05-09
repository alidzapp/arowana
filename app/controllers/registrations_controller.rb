class RegistrationsController < Devise::RegistrationsController
  def new
    redirect_to new_user_session_path, flash: { danger: 'Registration is disabled.' }
  end

  def create
    redirect_to new_user_session_path, flash: { danger: 'Registration is disabled.' }
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:api_key, :email, :password, :password_confirmation, :current_password)
  end
end