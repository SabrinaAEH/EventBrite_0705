class Event < ApplicationRecord

  belongs_to :admin, class_name: "User", foreign_key: "admin_id"
  has_many :attendances
  has_many :participants, through: :attendances, source: :user

end
