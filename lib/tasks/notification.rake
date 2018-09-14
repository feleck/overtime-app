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
end
