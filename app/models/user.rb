class User < ApplicationRecord
  enum permission_level: { buyer: 0, owner: 1, admin: 2 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :services
  has_many :bookings
end