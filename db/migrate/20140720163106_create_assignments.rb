class CreateAssignments < ActiveRecord::Migration
  def change
    drop_table :assignments

    create_table :assignments do |t|
      t.integer :user_id
      t.integer :role_id

      t.timestamps
    end
  end
end
