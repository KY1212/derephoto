class SortsController < ApplicationController

  def index
      @sorts = Image.search(params[:search])
      @count_post = @sorts.count
  end


  private

  def image_params
<<<<<<< HEAD
    params.fetch(:image, {}).permit(:name,, :comment, :idolname, :idoltype, :mv, :avatar )
=======
    params.fetch(:image, {}).permit(:name, :comment, :idolname, :idoltype, :mv, :avatar )
>>>>>>> sort
  end
end
