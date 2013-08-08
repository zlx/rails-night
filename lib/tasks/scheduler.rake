desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Generate upcoming email notification job..."
    Activity.ongoing.where("start_at < ? and start_at > ?", 1.hour.since, Time.zone.now).each do |activity|
      ActivityMailer.delay.upcoming_email(activity)
      puts "Activity: #{activity.title} processed"
    end
  puts "done."
end
