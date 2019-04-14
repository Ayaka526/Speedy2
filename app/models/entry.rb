class Entry < ApplicationRecord
	belongs_to :feed
	has_many :stocks, dependent: :destroy

	 def self.search(search)
      if search
        Entry.where(['title LIKE ?', "%#{search}%" ])
      else
        Entry.all
      end
  end
end
