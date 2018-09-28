namespace :notification do
  desc 'Sends SMS notification to employees asking them to log if they have overtime'
  task sms: :environment do
    # 1 Schedule to run at Sunday at 5pm
    # 2. Iterate over oll employees
    # 3. Skip AdminUsers
    # 4. Send a message that has instructions and a link to log time
    # User.all.each do |user|
    #   SmsTool.send_sms()
    # end
  end

  desc 'Sends mail notification to managers(admin users) each day to inform of pending overtime requests'
  task manager_email: :environment do
    submitted_posts = Post.submitted
    admin_usera = AdminUser.all
    if submitted_posts.count.positive?
      admin_usera.each do |admin|
        ManagerMailer.email(admin).deliver_later
      end
    end
  end
end
