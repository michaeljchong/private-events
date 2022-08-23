class Event < ApplicationRecord
  validates :title, :date, :location, presence: true

  belongs_to :creator, class_name: "User"
end
