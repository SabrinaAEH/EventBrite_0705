class Event < ApplicationRecord

  belongs_to :user

  validates :start_date, presence: true
  validates :duration, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :location, presence: true

  has_many :attendances
  has_many :participants, through: :attendances, source: :user


end
