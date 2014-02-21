class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: 'Succesfully created your account'
    else
      render :new
    end

  end

  protected
  def user_params
    params.require(:user).permit([:name, :email, :summmary, :headline])
  end
end

