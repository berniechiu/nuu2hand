class Book < ActiveRecord::Base
  attr_accessible :condition, :notes, :title, :photo

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_attached_file :photo,
  	url:  "/assets/books/:id/:style/:basename.:extension",
  	path: ":rails_root/public/assets/books/:id/:style/:basename.:extension"

  validates :condition, presence: true, length: { maximum: 50 }
  validates :notes, presence: true, length: { maximum: 140 }
  validates :title, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true
  validates_attachment_presence :photo

  default_scope order: 'books.created_at DESC'

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
