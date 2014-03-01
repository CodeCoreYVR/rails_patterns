class BartersController < ApplicationController

  def index
    @barters = Barter.all
  end

  def new
    @barter = Barter.new
  end

  def create
    @barter = if is_a_response?
                CreateResponse.call(original_barter, barter_params)
              else
                CreateBarter.call(barter_params)
              end

    if @barter.persisted?
      redirect_to barters_url
    else
      render :new
    end
  end

  protected

  def is_a_response?
    params[:barter].has_key?(:barter_id)
  end

  def barter_params
    params.require(:barter).permit(:title, :accepting, :offerring, :name, :email)
  end

  def original_barter
    Barter.find(params[:barter][:barter_id])
  end
end
