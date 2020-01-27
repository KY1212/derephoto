class SortsController < ApplicationController

  def index
      @sorts = Image.search(params[:search])
      @count_post = @sorts.count
  end


  private

  def image_params
    params.fetch(:image, {}).permit(:name, :idolname, :idoltype, :mv, :avatar )
  end
end
