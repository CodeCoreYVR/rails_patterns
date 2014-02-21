class UserService

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def create(user_params)
    @user = User.new(user_params)
    if @user.save
      @user.mark_as_pending
      NotificationFeed.feed(:general).new_user(self)
      UserMailer.email_verification(@user).deliver
      true
    else
      false
    end
  end

  def confirm(user_id, confirmation)
    @user = User.find_by(id: user_id)
    return false unless @user

    if @user.confirm_email(confirmation)
      UserMailer.welcom_email(@user).deliver
      true
    else
      false
    end
  end

end

