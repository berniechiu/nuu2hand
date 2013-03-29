class AddIndexToUsersSchoolId < ActiveRecord::Migration
  def change
  	add_index :users, :school_id, unique: true
  end
end
