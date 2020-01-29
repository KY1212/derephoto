class LikesController < ApplicationController
  before_action :set_variables
  before_action :authenticate_user!

  def like
    like = current_user.likes.new(image_id: @image.id)
    like.save
  end

  def unlike
    like = current_user.likes.find_by(image_id: @image.id)
    like.destroy
  end

  private

  def set_variables
    @image = Image.find(params[:image_id])
    @id_name = "#like-link-#{@image.id}"
  end

end
