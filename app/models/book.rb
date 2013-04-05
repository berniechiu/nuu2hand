class Book < ActiveRecord::Base
  attr_accessible :condition, :notes, :title
  belongs_to :user

  validates :user_id, presence: true
end
