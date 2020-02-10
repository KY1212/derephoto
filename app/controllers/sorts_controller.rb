class SortsController < ApplicationController

  def index
      @sorts = Image.search(params[:search])
      @count_post = @sorts.count
      #タグリンク idolname
      if params[:images_idolname].blank?
      else
        @sorts = Image.new
        @sorts = Image.where(idolname: params[:images_idolname])
      end
  end


  private

  def image_params
    params.fetch(:image, {}).permit(:name, :comment, :idolname, :idoltype, :mv, :avatar )
  end
end
