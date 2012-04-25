class AddWineryIdToWineries < ActiveRecord::Migration
  def change
    add_column :wineries, :user_id, :integer

  end
end
