namespace :DelayedJob do
  desc "generate job for delay job"
  task :generate => :environment do
    Activity.ongoing.where("start_at < ? and start_at > ?", 1.hour.since, Time.zone.now).each do |activity|
      ActivityMailer.delay.upcoming_email(activity)
      p "processing Activity:#{activity.title}"
    end

  end
end
