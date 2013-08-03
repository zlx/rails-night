class Activity < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :author, class_name: 'User'

  delegate :nickname, to: :author, prefix: true, allow_nil: true
  

  STATUS = {
    0 => '筹备中',
    1 => '报名中',
    2 => '已结束'
  }.freeze

  def human_status
    STATUS[status||0]
  end

  def has_joined? user
    ActivitiesUser.exists?(user_id: user.id, activity_id: id)
  end
end
