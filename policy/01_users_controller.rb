class UsersController < ApplicationController

  def update
    user = User.find(params[:id])

    edit_time = Time.now - 15.mins
    can_edit = current_user.admin? ? true : user.updated_at < edit_time

    if can_edit && user.save
      redirect_to root_url, notice: 'Succesfully created your account'
    else
      user.errors.add(:base, "User was updated since #{edit_time}") unless can_edit
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit([:name, :email, :summmary, :headline])
  end
end

