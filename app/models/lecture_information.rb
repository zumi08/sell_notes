class LectureInformation < ActiveRecord::Base
  belongs_to :user
  belongs_to :college
  validates :name, presence: true
  validates :user_id, presence: true
  validates :teacher, presence: true
  validates :detail, presence: true
end
