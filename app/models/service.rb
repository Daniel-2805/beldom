class Service < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :category, presence: true
  validates :price, presence: true
end
