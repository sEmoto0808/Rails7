class Article < ApplicationRecord
  # concernで共通化
  include Visible

  # 1件の記事はコメントを複数持てる（One article can have many comments）
  # dependent: :destroy -> 記事を削除したら、その記事に紐づくコメントも削除
  has_many :comments, dependent: :destroy

  # バリデーション
  # titleの値が必ず存在しなければならない
  validates :title, presence: true
  # bodyの値が存在しなければならない
  # bodyの値には文字が10個以上含まれていなければならない
  validates :body, presence: true, length: { minimum: 10 }

  # NOTE:
  # Active Recordは、テーブルのあらゆるカラムごとにモデル属性を自動的に定義するので、
  # モデルファイル内でこれらの属性を宣言する必要はありません。
end
