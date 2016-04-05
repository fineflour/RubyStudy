class CreateIndications < ActiveRecord::Migration
  def up
    create_table :indications do |t|
      t.string :name_eng
      t.string :name_ko
      t.string :description

      t.timestamps null: false
    end
  end
  def down
    drop_table(:indications, if_exists: true)
  end

end
