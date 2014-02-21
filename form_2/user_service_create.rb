class UserServiceCreate < ServiceCall
  class Result < ServiceResult
    attribute :user, User
  end

  attribute :user, User

  def call

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

