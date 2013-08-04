namespace :DelayedJob do
  desc "generate job for delay job"
  task :generate => :environment do
    Activity.ongoing.where("start_at < ?", 1.hour.since).each do |activity|
      ActivityMailer.delay.upcoming_email(activity)
    end

  end
end
