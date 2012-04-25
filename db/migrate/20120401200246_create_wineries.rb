class CreateWineries < ActiveRecord::Migration
  def change
    create_table :wineries do |t|
      t.string :permit_number
      t.string :owner_name
      t.string :operating_name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :zip4
      t.string :county
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
