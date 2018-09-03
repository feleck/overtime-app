user = User.create(
  email: 'test@test.com',
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf',
  first_name: 'John',
  last_name: 'Maklowicz'
)
user2 = User.create(
  email: 'test2@test.com',
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf',
  first_name: 'Sid',
  last_name: 'Barret'
)
puts '2 users created'

AdminUser.create(
  first_name: 'Admin',
  last_name: 'User',
  email: 'admin@user.com',
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf'
)
puts 'admin created'

10.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale content", user: user)
end
puts '10 Posts have been created'

10.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale content", user: user2)
end
puts '10 Posts have been created'
