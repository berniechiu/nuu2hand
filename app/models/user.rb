# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  school_id  :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :school_id, :email, :password, :password_confirmation
  has_secure_password

  before_save do |user|
  	user.school_id = school_id.downcase
  	user.email = email.downcase
  end

  VALID_SCHOOL_ID = /\A[a-z]\d{7}\z/i
  validates :school_id, presence: true, length: { is: 8 },
  						          format: { with: VALID_SCHOOL_ID },
                        uniqueness: { case_sensitive: false }
                        
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
  					        uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
