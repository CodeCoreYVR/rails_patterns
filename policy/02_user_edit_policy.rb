class UserEditPolicy
  # include ActiveModel::Validations
  include Virtus.model

  attribute :user, User
  attribute :editing_user, User

  def valid?
    if editing_user.admin?
      true
    else
      validate_updated_before(Time.now - 15.mins)
    end
  end

  def validate_updated_before(time)
    errors.add(:base, "User was edited since #{time}") if user.updated_at < time
  end

end
