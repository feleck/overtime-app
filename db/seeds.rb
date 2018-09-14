user = User.create(
  email: 'test@test.com',
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf',
  first_name: 'John',
  last_name: 'Maklowicz',
  phone: '+48732230324'
)
user2 = User.create(
  email: 'test2@test.com',
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf',
  first_name: 'Sid',
  last_name: 'Barret',
  phone: '+48732230324'
)
puts '2 users created'

AdminUser.create(
  first_name: 'Admin',
  last_name: 'User',
  email: 'admin@user.com',
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf',
  phone: '+48732230324'
)
puts 'admin created'

10.times do |post|
  Post.create(
    date: Date.today,
    rationale: "#{post} rationale content",
    user: user,
    overtime_request: 2.5
  )
end
puts '10 Posts have been created'

10.times do |post|
  Post.create(
    date: Date.today,
    rationale: "#{post} rationale content",
    user: user2,
    overtime_request: 1.4
  )
end
puts '10 Posts have been created'


10.times do |audit_log|
  AuditLog.create(
    start_date: (Date.today - 6.days),
    user: user2,
    status: 0
  )
end
puts '10 Audit logs have been created!'
