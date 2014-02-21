class CompaniesController < AppliationController

  def new
    @company = Company.new
    @user = User.new
    render 'company_form'
  end

  def create
    @company = Company.new(company_params)
    @user = User.new(user_params)

    @user.valid?; @company.valid?

    if @user.errors.blank? &&  @company.errors.blank?
      User.tranaction do
        @user.save
        @company.save
        @company.users << @user
      end
      redirect_to root_url, notice: 'Created your company'
    else
      @user.errors.merge!(@company.errors)
      render :company_form
    end
  end


  def company_params
    params.require(:company).permit([:name, :address, :market, :tagline])
  end

  def user_params
    params.require(:user).permit([:name, :email])
  end
end
