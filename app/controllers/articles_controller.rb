class ArticlesController < ApplicationController

  # 記事のリストを表示する
  def index
    # コントローラ内のインスタンス変数はビューからも参照できる
    @articles = Article.all
  end

  # 記事を1件表示する
  def show
    # [params]はコントローラのアクションでもアクセスできる
    @article = Article.find(params[:id])
  end

  # 記事を1件作成する（データベースには保存しない）
  def new
    # インスタンス化された記事は、ビューでフォームをビルドする時に使う
    @article = Article.new
  end

  # 記事を1件作成する（データベースには保存する）
  def create
    @article = Article.new(article_params)

    if @article.save
      # 記事の保存に成功すると、その記事のページにリダイレクトする
      # http://localhost:3000/articles/#{@article.id}
      redirect_to @article

      # redirect_toメソッドを使うとブラウザで新しいリクエストが発生しますが、
      # renderメソッドは指定のビューを現在のリクエストとしてレンダリングします。
      # ここで重要なのは、redirect_toメソッドはデータベースやアプリケーションのステートが変更された後で使うべきであるという点です。
      # それ以外の場合に使うと、ユーザーがブラウザをリロードしたときに同じリクエストが再送信され、変更が重複してしまいます。
    else
      # 記事の保存に失敗した場合は、app/views/articles/new.html.erbに戻ってフォームを再表示し、
      # Turboで問題なく動くようにステータスコード4XX（400~499のいずれか）を返す。
      render :new, status: :unprocessable_entity
    end
  end

  # 記事を更新する
  def edit
    @article = Article.find(params[:id])
  end

  # 記事を更新する
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # 記事を削除する
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  # Strong Parametersを使う（強く型付けする）
  private
    def article_params
      # paramsをフィルターする
      params.require(:article).permit(:title, :body)
    end
end
