class ComediansController < ApplicationController
  def index
    if params[:age] != nil
      @comedians = Comedian.where(age: params[:age])
    else
      @comedians = Comedian.all
    end
  end

  def new
  end

  def create
    comedian = Comedian.new(comedian_params)
    redirect_to '/comedians/'
  end

  private
  def comedian_params
    params.require(:comedian).permit(:name)
  end
end
