class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_to '/kakeibos/new', notice: "ログインしました。"
    else
      render 'new'
      flash[:warning] = 'IDまたはパスワード、またはその両方が間違っています。'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to '/kakeibos/new'
  end
end
