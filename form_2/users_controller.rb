class UsersController < ApplicationController

  def create
    form = UserForm.new(form_params)
    if form.valid?
      result = UserService.call(user: form.user)
    else
      result = UserService::Result.new
    end

    if result.successful?
      redirect_to root_url, notice: 'Succesfully created your account'
    else
      form.add_errors(result)
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit([:name, :email, :summmary, :headline])
  end
end
