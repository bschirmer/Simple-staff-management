class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.integer :userId
      t.datetime :start
      t.datetime :finish
      t.decimal :breaklength

      t.timestamps
    end
  end
end
