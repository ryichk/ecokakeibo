class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  include SessionsHelper


  private
    #ユーザーのログインを確認する
    def logged_in_user
      unless logged_in?
        store_location
        redirect_to login_url, warning: "ログインしてください。"
      end
    end

end
