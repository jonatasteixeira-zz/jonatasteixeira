class AddIndexToSessions < ActiveRecord::Migration
  def change
    add_index :sessions, [:user_id, :device], unique: true
    add_column :sessions, :actived, :boolean, default: true
  end
end
