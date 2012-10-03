class CreateUsagersDailyRoutines < ActiveRecord::Migration
  def change
    create_table :usagers_daily_routines do |t|
      t.string :day
      t.string :presence
      t.string :meal
      t.integer :routine_id

      t.timestamps
    end
  end
end
