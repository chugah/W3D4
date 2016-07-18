class AddAwesomenessLevelToUser < ActiveRecord::Migration

  def change
    add_column :users, :awesomeness_level, :integer
  end

end
