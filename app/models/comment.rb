class Comment < ActiveRecord::Base
  attr_accessible :book_id, :content, :user_id
end
