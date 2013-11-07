namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_relationships
    make_publications
    make_comments
  end
end

def make_users
  admin = User.create!(name:     "Bruno Faúndez",
                       email:    "gameover_sxt_nah@hotmail.com",
                       password: "password",
                       password_confirmation: "password",
                       admin: true)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end

def make_publications
  users = User.all(limit: 6)
  10.times do
    title = Faker::Lorem.sentence(3)
    content = Faker::Lorem.sentence(500)
    users.each { |user| user.publications.create!(title: title, content: content) }
  end
end

def make_comments
  publications = Publication.all
  3.times do
    user = User.all.sample
    content = Faker::Lorem.sentence(3)
    publications.each { |publication| publication.comments.create!(content: content, user_id: user.id) }
  end
end