class Book < ActiveRecord::Base
  attr_accessible :condition, :notes, :title, :photo

  belongs_to :user
  has_attached_file :photo

  validates :condition, presence: true, length: { maximum: 50 }
  validates :notes, presence: true, length: { maximum: 140 }
  validates :title, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true

  default_scope order: 'books.created_at DESC'
end
