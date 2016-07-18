class RemoveStupidThing < ActiveRecord::Migration
  def change
    remove_column :users, :awesomeness_level, :integer
  end
end
