Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"

  # get "/articles", to: "articles#index"

  # リクエストのパスに含まれる特定の値をキャプチャして、その値を [params] というハッシュに保存
  # get "/articles/:id", to: "articles#show"

  # リソースフルルーティング
  # リソースのコレクション（collection: 集まり）を対応付けるのによく使われるルーティングをすべて対応付けてくれる
  resources :articles
end
