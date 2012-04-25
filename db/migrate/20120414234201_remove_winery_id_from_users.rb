class RemoveWineryIdFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :winery_id
      end

  def down
    add_column :users, :winery_id, :integer
  end
end
