class CreatePoints < ActiveRecord::Migration
  def up
    create_table :points do |t|
      t.string :name_eng
      t.string :name_ko
      t.string :location

      t.timestamps null: false
    end
  end
  def down
    drop_table(:points, if_exists: true)
  end
end
