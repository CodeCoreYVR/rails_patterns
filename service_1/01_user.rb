class User < ActiveRecord::Base

  validates_presence_of :name, :email, :summary, :headline
  validate :email_is_valid

  after_create :update_notification_feeds
  after_update :deliver_welcome_mail

  def update_notification_feeds
    NotificationFeed.feed(:general).new_user(self)
  end

  def deliver_welcome_email
    UserMailer.welcome_email(self).deliver if confirmed?
  end

  def confirmed?
    # check flag
  end

  def confirm_email(confirmation)
    # verify confirmation and set a flag
    self.save
  end

end
