class Event < ApplicationRecord
  validates :title, :date, :location, presence: true
end
