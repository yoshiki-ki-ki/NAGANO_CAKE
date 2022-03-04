# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :customer_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  # 退会しているかを判断するメソッド
  def customer_state
    # 【処理1】入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email:params[:customer][:email])
    # アカウントを取得できなかった場合、以降の処理を行わずに終了
    return if !@customer
    # 【処理2】取得したアカウントのパスワードと入力されたパスワードが一致しているか判断
    if @customer.valid_password?(params[:customer][:password]) && (@customer.is_active == false)
      # 【処理3】false→createアクションへ
      redirect_to new_end_user_registration_path
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
