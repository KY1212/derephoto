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
    @image.user_id = current_user.id
    if @image.save
      flash[:success] = "投稿に成功しました！"

      redirect_to root_url
    else
      @images = Image.all
      flash.now[:danger] = "投稿に失敗しました。投稿フォームをもう一度確認してみてください。"

      render :index
    end
  end

  def destroy
   @image = Image.find(params[:id]).destroy
      #destroyメソッドを使用し対象のツイートを削除する。
     redirect_to root_url
    end

  private

  def image_params
    params.fetch(:image, {}).permit(:name, :type, :mv, :avatar)
  end
end
