class CreateUserRoles < ActiveRecord::Migration
  def up
    create_table :user_roles do |t|
      t.references :user, index: true, foreign_key: true
      t.references :role, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
  def down
    drop_table(:user, if_exists: true)
  end
end
