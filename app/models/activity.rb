class Activity < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :author, class_name: 'User'
  has_many :comments, class_name: 'ActivityComment'

  validates :title, presence: true
  validates :start_at, presence: true, future_time: true

  scope :completed, -> { where(status: 2) }
  scope :uncompleted, -> { where("status != ?", 2) }
  scope :ongoing, -> { where(status: 1) }
  

  STATUS = {
    0 => '筹备中',
    1 => '报名中',
    2 => '已结束'
  }.freeze

  def human_status
    STATUS[status||0]
  end

  def can_join? user
    ongoing? && !has_joined?(user)
  end

  def has_joined? user
    ActivitiesUser.exists?(user_id: user.id, activity_id: id)
  end

  def ongoing?
    status == 1
  end

  def completed?
    status == 2
  end
end
