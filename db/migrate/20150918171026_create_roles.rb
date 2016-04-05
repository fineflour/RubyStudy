class CreateRoles < ActiveRecord::Migration
  def up
    create_table :roles do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
  def down
    drop_table(:roles, if_exists: true)
  end
end
