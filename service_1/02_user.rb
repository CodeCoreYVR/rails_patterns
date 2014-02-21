class User < ActiveRecord::Base

  validates_presence_of :name, :email, :summary, :headline
  validate :email_is_valid

  def confirmed?
    # check flag
  end

  def confirm_email(confirmation)
    # verify confirmation and set a flag
    self.save
  end

end
