class Barter < ActiveRecord::Base

  after_create :notify_submitter

  def notify_submitter
    UserMailer.barter_posted(self).deliver
  end

end
