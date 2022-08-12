class Event < ApplicationRecord
  validates :title, :date, :location, presence: true

  belongs_to :creators, class_name: "User"
end
