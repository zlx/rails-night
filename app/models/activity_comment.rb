class ActivityComment < ActiveRecord::Base
  belongs_to :activity
  belongs_to :author, class_name: 'User'
  belongs_to :reply_to, class_name: 'ActivityComment'

  validates :activity_id, :subject, presence: true

  delegate :nickname, :avatar_url, to: :author, prefix: true, allow_nil: true
end
