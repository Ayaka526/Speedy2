class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :body
      t.integer :image_id
      t.integer :impressions_count

      t.timestamps
    end
  end
end
