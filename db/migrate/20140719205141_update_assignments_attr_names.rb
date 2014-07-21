class UpdateAssignmentsAttrNames < ActiveRecord::Migration
  def change
    rename_column :assignments, :create, :can_create
    rename_column :assignments, :read, :can_read
    rename_column :assignments, :update, :can_update
    rename_column :assignments, :delete, :can_delete
  end
end
