class Booking < ApplicationRecord
  belongs_to :service
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :address_client, presence: true
end
