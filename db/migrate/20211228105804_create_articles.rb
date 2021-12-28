class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      # デフォルトで :id カラムを主キー（オートインクリメント）
      t.string :title
      t.text :body

      # timestampsメソッドを呼び出し
      # :created_at, :updated_at カラムを追加、railsによって自動管理
      t.timestamps
    end
  end
end
