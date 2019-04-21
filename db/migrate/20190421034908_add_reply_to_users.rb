class AddReplyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :reply, :text
  end
end
