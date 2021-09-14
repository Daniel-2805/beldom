class Booking < ApplicationRecord
  belongs_to :service
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :address_client, presence: true
  validate :end_date_is_after_start_date

  geocoded_by :address_client
  after_validation :geocode, if: :will_save_change_to_address_client?

  private
  
  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?
  
    if end_date < start_date
      errors.add(:end_date, "no puede ser antes de la fecha de inicio") 
    end 
  end
end