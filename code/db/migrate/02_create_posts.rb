class CreatePosts < ActiveRecord::Migration

  def change
    create_table :posts do |t|
      t.references :user
      # ^ is the same as t.integer :user_id
      t.column :title, :string
      t.column :body, :string
      t.column :published, :boolean
      t.timestamps null: false
    end
  end

end
