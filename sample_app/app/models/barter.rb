class Barter < ActiveRecord::Base
  belongs_to :barter
  has_many :responses, class_name: 'Barter'

  validates :email, presence: true

  after_create :notify_response

  def notify_response
    UserMailer.barter_response(self, self.barter) if barter_id.present?
  end

end
