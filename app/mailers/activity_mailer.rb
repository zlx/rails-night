class ActivityMailer < ActionMailer::Base
  default from: Settings.deliver_mail
  add_template_helper(ApplicationHelper)

  def welcome_email activity, user
    @user = user
    @activity = activity
    mail(to: @user.email,
         subject: '欢迎参加 Rails-Night')
  end

  def upcoming_email activity
    @activity = activity
    mail(to: @activity.users.map(&:email), subject: 'Rails-Night 即将开始')
  end
end
