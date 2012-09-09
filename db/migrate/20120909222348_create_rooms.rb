class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :welcome
      t.string :moderator_pw
      t.string :viewer_pw
      t.boolean :recorded

      t.timestamps
    end
  end
end
