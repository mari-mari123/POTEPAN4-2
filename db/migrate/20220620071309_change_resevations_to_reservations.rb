class ChangeResevationsToReservations < ActiveRecord::Migration[6.1]
  def change
    rename_table :resevations, :reservations
  end
end
