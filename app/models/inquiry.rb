class Inquiry < ApplicationRecord
belongs_to :user
  default_scope -> { order(created_at: :desc) }

    validates :user_id, presence: true

    validates :title, presence: true, length: { maximum: 20 }
    validates :body, presence: true, length: { maximum: 100 }

  def self.search(search)
      if search
        Inquiry.where(['title LIKE ? OR body LIKE ?',
        			   "%#{search}%", "%#{search}%" ])
      else
        Inquiry.all
      end
  end

end
