class CompaniesController < AppliationController

  def new
    @company_form = CompanyForm.new
    render 'company_form'
  end

  def create
    @company_form = CompanyForm.new(company_form_params)

    if @company_form.save
      redirect_to root_url, notice: 'Created your company'
    else
      render :company_form
    end
  end

  def edit
    @company_form = CompanyForm.new(
      company: current_user.company,
      user: current_user
    )
  end


  def company_params
    params.
      require(:company_form).
      permit([:name, :email, :company_name, :address, :market, :tagline])
  end
end
