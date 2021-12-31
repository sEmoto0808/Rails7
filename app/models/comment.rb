class Comment < ApplicationRecord
  # concernで共通化
  include Visible

  # 1件のコメントは1件の記事に属する（Each comment belongs to one article）
  belongs_to :article
end
