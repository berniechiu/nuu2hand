class Book < ActiveRecord::Base
  attr_accessible :condition, :notes, :title

  belongs_to :user

  validates :condition, presence: true, length: { maximum: 30 }
  validates :notes, presence: true, length: { maximum: 140 }
  validates :title, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true

  default_scope order: 'books.created_at DESC'
end
