class CreateUsersWineries < ActiveRecord::Migration
  def change
    create_table :users_wineries do |t|
      t.integer :user_id
      t.integer :winery_id

      t.timestamps
    end
  end
end
