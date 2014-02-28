class BartersController < ApplicationController

  def index
    @barters = Barter.all
  end

  def new
    @barter = Barter.new(params.permit(:barter_id))
  end

  def create
    @barter = Barter.new(barter_params)

    if @barter.save
      redirect_to barters_url
    else
      render :new
    end
  end

  def destroy
    @barter = Barter.find(params[:id])
    @barter.destroy
    redirect_to barters_url, notice: 'Removed barter'
  end

  protected

  def barter_params
    params.require(:barter).permit(:title, :barter_id, :accepting, :offerring, :name, :email)
  end
end
