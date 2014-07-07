class DropTableSession < ActiveRecord::Migration
  def change
    remove_index :sessions, column: [:user_id, :device]
    drop_table :sessions
  end
end
