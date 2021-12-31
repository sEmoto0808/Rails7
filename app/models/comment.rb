class Comment < ApplicationRecord
  # 1件のコメントは1件の記事に属する（Each comment belongs to one article）
  belongs_to :article

  VALID_STATUSES = [ 'public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == 'archived'
  end

end
