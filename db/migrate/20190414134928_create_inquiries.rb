class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|

    t.string :title
    t.string :body
    t.string :message
    t.timestamps

    end
  end
end
