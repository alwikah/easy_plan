class AddUsagersTable < ActiveRecord::Migration
  def up
	  create_table 'usagers' do |table|
		table.string :given_name
		table.string :family_name
		table.date :birth_date
	  end
  end

  def down
	  drop_table 'usagers'
  end
end
