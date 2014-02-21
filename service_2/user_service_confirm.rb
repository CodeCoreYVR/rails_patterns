class UserServiceConfirm < ServiceCall

  class UnconfirmableUser < User
    def confirm_email; false; end
  end

  # input params
  attribute :user_id, Fixnum
  attribute :confirmation, String

  def call
    result.add_error_message('No user found') unless user.persisted?

    if user.confirm_email(confirmation)
      UserMailer.welcome_email(user).deliver

      result.successful!
    else
      result.add_errors(user)
    end

    result
  end

  protected

  def user
    User.find_by(id: user_id) || UnconfirmableUser.new
  end

end

