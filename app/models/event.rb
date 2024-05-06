class Event < ApplicationRecord
  belongs_to :event_admin, foreign_key: :admin_id, class_name: "User"
  has_many :attendances
  has_many :users, through: :attendances, source: :user
end
