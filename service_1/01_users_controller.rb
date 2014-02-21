class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      @user.mark_as_pending
      UserMailer.email_verification(@user).deliver
      redirect_to root_url, notice: 'Succesfully created your account'
    else
      render :new
    end

  end

  def confirm
    @user = User.find_by(id: params[:id]) || User.new
    if @user.confirm_email(params[:confirm])
      redirect_to root_url, notice: 'Succesfully created your account'
    else

    end

  end


  protected
  def user_params
    params.require(:user).permit([:name, :email, :summmary, :headline])
  end
end
