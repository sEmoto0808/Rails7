class ArticlesController < ApplicationController

  # 記事のリストを表示する
  def index
    # コントローラ内のインスタンス変数はビューからも参照できる
    @articles = Article.all
  end
end
