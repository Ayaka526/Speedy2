class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :browsing_histories, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :inquiries, dependent: :destroy

  def self.search(search)
      if search
        User.where(['name LIKE ?', "%#{search}%" ])
      else
        User.all
      end
  end


  def already_stocked?(entry)
    self.stocks.exists?(entry_id: entry.id)
  end

end
