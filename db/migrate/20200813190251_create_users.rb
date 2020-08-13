class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.boolean :admin
      t.string :name
      t.string :position
      t.string :department
      t.integer :workload

      t.timestamps
    end
  end
end
