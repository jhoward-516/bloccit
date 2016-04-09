class AdvertisementsController < ApplicationController
  def index
    @ads = Advertisement.all
  end

  def show
    @ad = Advertisement.find(params[:id])
  end

  def new
    @ad = Advertisement.new
  end

  def create
    @ad = Advertisement.new
    @ad.title = params[:ad][:title]
    @ad.body = params[:ad][:body]
    @ad.price = params[:ad][:price]
  end
end
