class ShortenersController < ApplicationController
  def index
    @shortener = Shortener.all
  end

  def show
    @shortener = Shortener.find(params[:id])
  end

  def new
    @shortener = Shortener.new
  end

  def create
    @shortener = Shortener.new(shortener_params)
    if @shortener.save
      redirect_to shorteners_path
    else
      render "new"
    end
  end

  private 

  def shortener_params
    params.require(:shortener).permit(:given_url)
  end
end
