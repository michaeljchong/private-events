class Event < ApplicationRecord
  validates :title, :date, :location, presence: true

  belongs_to :creator, class_name: "User"
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances

  def self.upcoming
    where("date > ?", Time.now)
  end

  def self.past
    where("date < ?", Time.now)
  end
end
