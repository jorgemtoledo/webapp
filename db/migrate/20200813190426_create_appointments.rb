class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :appointment_date
      t.integer :appointment_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
