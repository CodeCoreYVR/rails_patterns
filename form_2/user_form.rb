class UserForm < FormObject
  attribute :name, String
  attribute :email, String
  attribute :summary, String
  attribute :headline, String

  validates_presence_of :name, :email, :summary, :headline
  validate :email_is_valid

  def user
    User.new(name: name, headline: headline, email: email, summary: summary)
  end

end
