class Entry < ApplicationRecord
	belongs_to :feed
	has_many :stocks, through: :likes, source: :user
	 default_scope -> { order(created_at: :desc) }

end
