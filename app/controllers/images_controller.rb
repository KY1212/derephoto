class ImagesController < ApplicationController

  def index
    @images = Image.all


  if params[:idolname].blank?
    @count_post = @images.count
    else
      @images = Image.search(params[:idolname])
      @count_post = @images.count

  end
    @image = Image.new
  end

  def new
      @idol = Idol.new

      idols = Idol.all
      idols = idols.map(&:idolname) #:idolnameを取り出し、戻り値として配列で作成
  render json: idols.to_json

   respond_to do |format| #respondo_to=指定した形式で返すようにするメソッド
       format.html
       format.json
   end
  end

  def auto_complete
  @idols = Idol.select(:idolname).where("idolname like '%" + params[:term] + "%'").order(:idolname)
  @idols = @idols.map(&:idolname)
  render json: @idols.to_json
end

def auto_complete_search
@idols = Idol.select(:idolname).where("search like '%" + params[:term] + "%'").order(:idolname)
@idols = @idols.map(&:idolname)
render json: @idols.to_json
end


  def create
    if user_signed_in?

    @image = Image.new(image_params)
    @image.idolname = params[:image][:idolname]


    @image.user_id = current_user.id
    if @image.save
      flash[:success] = "投稿に成功しました！"

      redirect_to root_url
    else
      @images = Image.all
      flash.now[:danger] = "投稿に失敗しました。投稿フォームをもう一度確認してみてください。"

      render "index"
      return
    end

  else
    render templete: "users/sign_in"
  end
  end

  def destroy
   @image = Image.find(params[:id]).destroy
      #destroyメソッドを使用し対象のツイートを削除する。
     redirect_to root_url
    end

  private

  def image_params
    params.fetch(:image, {}).permit(:name, :comment, :idolname, :idoltype, :mv, :avatar )
  end
end
