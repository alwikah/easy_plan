class CreateCalendarsEvents < ActiveRecord::Migration
  def change
    create_table :calendars_events do |t|
      t.string :title
      t.time :start_date
      t.time :end_date
      t.integer :owner_id
      t.string :type

      t.timestamps
    end
  end
end
