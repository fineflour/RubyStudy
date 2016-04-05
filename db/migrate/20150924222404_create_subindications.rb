class CreateSubindications < ActiveRecord::Migration
  def up
    create_table :subindications do |t|
      t.string :name_eng
      t.string :name_ko
      t.string :description

      t.timestamps null: false
    end
  end
  def down
    drop_table(:subindications, if_exists: true)
  end

end
