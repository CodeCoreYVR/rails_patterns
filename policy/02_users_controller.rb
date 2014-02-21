class UsersController < ApplicationController

  def update
    user = User.find(params[:id])
    edit_policy = UserEditPolicy.new(user: user, editing_user: current_user)

    if edit_policy.valid? && user.save
      redirect_to root_url, notice: 'Succesfully created your account'
    else
      user.errors.messages.merge!(edit_policy.errors)
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit([:name, :email, :summmary, :headline])
  end
end

