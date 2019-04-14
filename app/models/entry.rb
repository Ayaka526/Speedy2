class Entry < ApplicationRecord
	belongs_to :feed

	 def self.search(search)
      if search
        Entry.where(['title LIKE ?', "%#{search}%" ])
      else
        Entry.all
      end
  end
end
