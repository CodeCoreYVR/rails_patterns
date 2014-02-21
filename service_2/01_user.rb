class User < ActiveRecord::Base

  validates_presence_of :name, :email, :summary, :headline
  validate :email_is_valid

  after_create :update_notification_feeds

  def update_notification_feeds
    NotificationFeed.feed(:general).new_user(self)
  end

end
