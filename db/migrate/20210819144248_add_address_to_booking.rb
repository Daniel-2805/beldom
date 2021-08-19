class AddAddressToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :address_client, :string
  end
end
