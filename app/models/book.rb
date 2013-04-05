class Book < ActiveRecord::Base
  attr_accessible :condition, :notes, :title, :user_id
end
