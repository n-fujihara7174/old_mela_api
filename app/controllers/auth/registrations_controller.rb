class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController

  private

  def sign_up_params
    params.permit(:name, :user_id, :password, :password_confirmation)
  end

end
