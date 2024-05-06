class User < ApplicationRecord
  has_many :event_admins, foreign_key: :admin_id, class_name: "Event"
  has_many :attendances
  has_many :events, through: :attendances
end
