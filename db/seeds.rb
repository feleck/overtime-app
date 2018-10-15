employee = Employee.create(
  email: 'test@test.com',
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf',
  first_name: 'John',
  last_name: 'Maklowicz',
  phone: '8732230324',
  ssn: 1243,
  company: 'ARR Paolo'
)

user2 = User.create(
  email: 'test2@test.com',
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf',
  first_name: 'Sid',
  last_name: 'Barret',
  phone: '8732230324',
  ssn: 1243,
  company: 'ARR Paolo'
)
puts '2 users created'

AdminUser.create(
  first_name: 'Admin',
  last_name: 'User',
  email: 'admin@mail.com',
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf',
  phone: '8732230324',
  ssn: 1243,
  company: 'ARR Paolo'
)
puts 'admin created'

AuditLog.create(
  user: user2,
  status: 0,
  start_date: (Date.today - 7.days)
)
AuditLog.create(
  user: user2,
  status: 0,
  start_date: (Date.today - 14.days)
)

AuditLog.create(
  user: user2,
  status: 0,
  start_date: (Date.today - 21.days)
)
puts '3 Audit logs for user2 have been created!'

AuditLog.create(
  user: employee,
  status: 0,
  start_date: (Date.today - 7.days)
)
AuditLog.create(
  user: employee,
  status: 0,
  start_date: (Date.today - 14.days)
)
AuditLog.create(
  user: employee,
  status: 0,
  start_date: (Date.today - 21.days)
)
puts '3 Audit logs for user have been created!'

5.times do |post|
  Post.create(
    date: Date.today,
    rationale: "#{post} Kitsch cardigan af wolf stumptown. Irony beard la croix cliche pabst affogato DIY 8-bit kinfolk PBR&B craft beer pop-up butcher put a bird on it disrupt. Vape hexagon williamsburg, authentic flannel cold-pressed wolf. ",
    user: employee,
    overtime_request: 2.5
  )
end
puts '5 Posts have been created'

5.times do |post|
  Post.create(
    date: Date.today,
    rationale: "#{post} Freegan polaroid gluten-free enamel pin try-hard fingerstache tousled put a bird on it shoreditch bushwick chia. Umami fashion axe twee etsy tote bag la croix lomo post-ironic microdosing food truck pickled cardigan drinking vinegar coloring book.",
    user: user2,
    overtime_request: 1.4
  )
end
puts '5 Posts have been created'
