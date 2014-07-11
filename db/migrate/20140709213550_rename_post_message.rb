class RenamePostMessage < ActiveRecord::Migration
  def change
   rename_column :posts, :message, :body
  end
end
