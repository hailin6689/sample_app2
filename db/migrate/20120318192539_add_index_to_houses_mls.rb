class AddIndexToHousesMls < ActiveRecord::Migration
  def change
	add_index :houses, :mls,unique: true
  end
end
