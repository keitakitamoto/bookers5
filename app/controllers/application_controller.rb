class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :about]
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_in_path_for(resource)
    user_path(resource)
    # サインインした後に飛ぶページ currnt_userは現在ログインしているユーザー showとindexのパス名を間違っていることが多い
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  
  add_flash_types :success, :info, :warning, :danger


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys:[:name])
    # すトロングパラメーターにてnameを追加
  end
end
