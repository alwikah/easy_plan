class CreateUsagersRoutines < ActiveRecord::Migration
  def change
    create_table :usagers_routines do |t|
      t.integer :owner_id

      t.timestamps
    end
  end
end
