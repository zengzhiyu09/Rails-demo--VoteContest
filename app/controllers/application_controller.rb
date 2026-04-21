class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # 配置 Devise 允许的额外参数
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # 在注册（sign_up）时，允许 username, phone, gender, birth_year 通过
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :phone, :gender, :birth_year])
  end
end
