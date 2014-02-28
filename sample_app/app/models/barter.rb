class Barter < ActiveRecord::Base
  belongs_to :barter
  has_many :responses, class_name: 'Barter'

  after_create :notify_response
  after_create :notify_submitter

  def notify_submitter
    UserMailer.barter_posted(self).deliver
  end

  def notify_response
    UserMailer.barter_response(self, self.barter) if barter_id.present?
  end

end
