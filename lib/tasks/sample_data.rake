namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
  	admin = User.create!(school_id: "u9833040",
  				               email: "example@railstutorial.org",
                				 password: "foobar",
                				 password_confirmation: "foobar")
    admin.toggle!(:admin)

  	25.times do |n|
  	  school_id = "u98330" + "#{n+10}"
  	  email = "example-#{n+1}@railstutorial.org"
  	  password = "password"
  	  User.create!(school_id: school_id,
  	  			   email: email,
  	  			   password: password,
  	  			   password_confirmation: password)
  	end

    users = User.all(limit: 6)
    10.times do
      title = Faker::Lorem.sentence(1)
      condition = Faker::Lorem.sentence(1)
      notes = Faker::Lorem.sentence(5)
      users.each do |user|
        user.books.create!(title: title,
                           condition: condition,
                           notes: notes)
      end
    end
  end
end