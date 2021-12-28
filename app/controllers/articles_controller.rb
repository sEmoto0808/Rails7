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
end
