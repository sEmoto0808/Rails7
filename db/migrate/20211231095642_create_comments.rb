class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      # article_idという名前のinteger型カラムとそのインデックス、そしてarticlesのidカラムを指す外部キー制約を設定します
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
