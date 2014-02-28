class BartersController < ApplicationController

  def index
    @barters = Barter.all
  end

  def new
    @barter = Barter.new
  end

  def create
    @barter = CreateBarter.call(barter_params)
    if @barter.persisted?
      redirect_to barters_url
    else
      render :new
    end
  end

  protected

  def barter_params
    params.require(:barter).permit(:title, :barter_id, :accepting, :offerring, :name, :email)
  end
end
