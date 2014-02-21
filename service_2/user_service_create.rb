class UserServiceCreate < ServiceCall
  class Result < ServiceResult
    attribute :user, User
  end

  attribute :user_params, Object, default: {}

  def call
    user = User.new(user_params)

    if user.save && user.mark_as_pending
      NotificationFeed.feed(:general).new_user(user)
      UserMailer.email_verification(user).deliver

      result.user = user
      result.successful!
    else
      result.add_errors(user)
    end

    result
  end

end

