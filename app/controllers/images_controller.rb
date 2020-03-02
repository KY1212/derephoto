class ImagesController < ApplicationController

  def index
    @images = Image.all.order(id: "DESC")
    #ページネーション
    @images = @images.page(params[:page])
    #全ての投稿数取得
    @images_count = Image.count

    #タグリンク idolname
    if params[:images_idolname].blank?
    else
      @images = Image.new
      #タグの文字列がidolnameにいくつ存在するか
      @images = Image.where(idolname: params[:images_idolname]).order(id: "DESC")
      @images = @images.page(params[:page])
      #タグidolnameのレコード数をcountで取得
      @images_count = Image.where(idolname: params[:images_idolname]).count
    end

    #タグリンク idoltype
    if params[:images_idoltype].blank?
    else
      @images = Image.new
      #タグの文字列がidoltypeにいくつ存在するか
      @images = Image.where(idoltype: params[:images_idoltype]).order(id: "DESC")
      @images = @images.page(params[:page])
      #タグidoltypeのレコード数をcountで取得
      @images_count = Image.where(idoltype: params[:images_idoltype]).count
    end

    #タグリンク mv
    if params[:images_mv].blank?
    else
      @images = Image.new
      #タグの文字列がmvにいくつ存在するか
      @images = Image.where(mv: params[:images_mv]).order(id: "DESC")
      @images = @images.page(params[:page])
      #タグimages_mvのレコード数をcountで取得
      @images_count = Image.where(mv: params[:images_mv]).count
    end

    #検索フォーム
    if params[:idolname].blank?
    @search_count = Image.search(params[:idolname]).count
    #検索結果0件の場合、viewにて0件だった旨をメッセージで表示
    elsif @search_count == 0

    else
      @images = Image.search(params[:idolname]).order(id: "DESC")
      @images = @images.page(params[:page])
      #フォームに入力された文字列をidolnameから検索、存在したレコード数をcountで取得
      @images_count = Image.search(params[:idolname]).count
    end

    @image = Image.new
    Image.find_by(id: params[:id])
  end

  def show
    @image = Image.find(params[:id])
    @images = @image.avatar
    @comments = @image.comments
    @comment = @image.comments.build
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
        @images = @images.page(params[:page])
        @images_count = Image.count

        render "index"
        return
      end

    else
      flash[:danger] = "ログインしてください"
      redirect_to user_session_url
    end
  end

  def edit
    @image = Image.find_by(id: params[:id])
  end

  def update
  @image_update = Image.find_by(id: params[:id])
    if @image_update = @image_update.update(image_params)
      flash[:success] = '投稿を編集しました。'
      redirect_to root_url
    else
      flash[:danger] = '更新に失敗しました。画像選択フォーム、アイドル名が入っているかを確認してください'
      redirect_to "/images/#{params[:id]}/edit"
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
