class CommentsController < ApplicationController

  # Basic認証
  # コメントの削除も認証済みユーザーにだけ許可したい
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  # コメントを作成する
  def create
    # コメント関連のリクエストでは、コメントが追加される先の記事がどれであったかを追えるようにしておく必要があります
    @article = Article.find(params[:article_id])
    # この方法でやれば、コメントと記事が自動的にリンクされ、指定された記事に対してコメントが従属するようになります
    @comment = @article.comments.create(comment_params)
    # 新しいコメントの作成が完了したら、article_path(@article)ヘルパーを用いて元の記事の画面に戻ります
    redirect_to article_path(@article)
  end

  # コメントを削除する
  def destroy
    # まずどの記事が対象であるかを検索して@articleに保存し
    @article = Article.find(params[:article_id])
    # @article.commentsコレクションの中のどのコメントが対象であるかを特定して@commentに保存します
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
