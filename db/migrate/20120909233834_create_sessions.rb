class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :name
      t.string :start_time
      t.string :moderators
      t.string :viewers
      t.boolean :recorded

      t.timestamps
    end
  end
end
