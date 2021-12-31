class Comment < ApplicationRecord
  # 1件のコメントは1件の記事に属する（Each comment belongs to one article）
  belongs_to :article
end
