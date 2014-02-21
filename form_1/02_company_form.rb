class CompanyForm
  extend ActiveModel::Naming
  # extend ActiveModel::Translation # if you need i18n string translations
  include ActiveModel::Conversion, ActiveModel::Validations
  include Virtus.model

  attribute :name, String
  attribute :email, String
  attribute :company_name, String
  attribute :address, String
  attribute :market, String
  attribute :tagline, String

  attribute :company, Company
  attribute :user, User

  validates_presence_of :name, :email, :company_name
  validate :email_is_valid
  # more

  def company=(company)
    self.company_name = company.name
  end

  def user=(user)
    self.name = user.name
    self.email = user.email
    self.market = user.market
    self.tagline = user.tagline
  end

  # necessary for ActiveModel
  def persisted?
    false
  end

  def save
    return false unless valid?

    persist!
    true
  end


  private

  def user
    User.new(
      name: name,
      email: email
    )
  end

  def persist!
    Company.transaction do

      @user = User.create(name: name, email: email)
      @company = Company.create(
        name: company_name,
        address: address,
        market: market,
        tagline: tagline
      )

      @company.users << @user
    end
  end

end
