class UsersServiciedController < ApplicationController

  def create
    service = UserService.new
    if service.create(user_params)
      redirect_to root_url, notice: 'Succesfully created your account'
    else
      @user = service.user
      render :new
    end

  end

  def confirm
    service = UserService.new
    if service.confirm(params[:user_id], params[:confirm])
      redirect_to root_url, notice: 'Succesfully created your account'
    else
      @user = service.user
      render :confirm
    end
  end


  protected
  def user_params
    params.require(:user).permit([:name, :email, :summmary, :headline])
  end
end
