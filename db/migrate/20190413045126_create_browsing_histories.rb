class CreateBrowsingHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :browsing_histories do |t|
    	t.integer :user_id
    	t.integer :entry_id
    	t.integer :impressions_count, default: 0

      t.timestamps
    end
  end
end
