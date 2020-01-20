class ImagesController < ApplicationController

  def index
    @images = Image.all
    @image = Image.new
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to root_url, notice: 'Add image'
    else
      @images = Image.all

      render :index
    end
  end

  private

  def image_params
    params.fetch(:image, {}).permit(:name, :avatar)
  end
end
