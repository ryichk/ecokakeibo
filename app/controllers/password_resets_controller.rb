class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.creare_reset_digest
      @user.send_password_reset_email
      flash[:info] = "パスワードをリセットするためのメールを送りました。"
      redirect_to 'kakeibos#new'
    else
      flash.now[:danger] = "メールアドレスが見つかりません。"
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "空にはできません")
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "パスワードはリセットされました"
      redirect_to @user
    else
      render 'edit'
    end
  end

    private
      def user_params
        params.require(:user).permit(:password, :password_confirmation)
      end

      #beforeフィルタ

      def get_user
        @user = User.find_by(email: params[:email])
      end

      #正しいユーザーを確認する
      def valid_user
        unless (@user && @user.activated? && @user.authenticated?(:reset, params[:id]))
          redirect_to root_url
        end
      end

      #再設定用トークンが期限切れかどうかを確認する
      def check_expiration
        if @user.password_reset_expired?
          flash[:danger] = "パスワードリセットは期限切れです"
          redirect_to new_password_reset_url
        end
      end
end
