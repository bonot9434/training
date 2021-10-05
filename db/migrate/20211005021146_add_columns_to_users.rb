class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introduction, :text
    add_column :users, :profile_image_id, :string
    add_column :users, :give, :string
    add_column :users, :take, :string
    add_column :users, :industry, :string
  end
end
