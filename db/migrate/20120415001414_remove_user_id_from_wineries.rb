class RemoveUserIdFromWineries < ActiveRecord::Migration
  def up
    remove_column :wineries, :user_id
      end

  def down
    add_column :wineries, :user_id, :integer
  end
end
