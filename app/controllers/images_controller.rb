class ImagesController < ApplicationController

  def index
    @images = Image.all.order(id: "DESC")


    #タグリンク idolname
    if params[:images_idolname].blank?
      @count_post = @images.count
    else
      @images = Image.new
      @images = Image.where(idolname: params[:images_idolname])
    end


  #タグリンク idoltype
  if params[:images_idoltype].blank?
    @count_post = @images.count
  else
    @images = Image.new
    @images = Image.where(idoltype: params[:images_idoltype])
  end

  #タグリンク mv
  if params[:images_mv].blank?
    @count_post = @images.count
  else
    @images = Image.new
    @images = Image.where(mv: params[:images_mv])
  end



  #検索
  if params[:idolname].blank?
    @count_post = @images.count

  else
    @images = Image.search(params[:idolname])
    @count_post = @images.count
  end

    @image = Image.new
  end



  #動くかテスト
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
    #ログインしていない場合、ログイン画面へリダイレクトさせる
    if user_signed_in?
    @image = Image.new(image_params)
    #入力フォームからストロングパラメータｄ取得
    @image.idolname = params[:image][:idolname]
    @image.user_id = current_user.id

      if @image.save
        flash[:success] = "投稿に成功しました！"
        #rootパスにリダイレクト
        redirect_to root_url
      else
        @images = Image.all
        flash.now[:danger] = "投稿に失敗しました。投稿フォームをもう一度確認してみてください。"
        render "index"
        return
      end

    else
      flash[:danger] = "ログインしてください"
      redirect_to user_session_url
    end
  end

  def destroy
   #destroyメソッドを使用し対象のツイートを削除する。
   @image = Image.find(params[:id]).destroy
    redirect_to root_url
  end

  private
  def image_params
    params.fetch(:image, {}).permit(:name, :comment, :idolname, :idoltype, :mv, :avatar )
  end

end
