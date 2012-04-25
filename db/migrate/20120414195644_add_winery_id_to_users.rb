class AddWineryIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :winery_id, :integer

  end
end
