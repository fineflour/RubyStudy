class CreateDiseases < ActiveRecord::Migration
  def up
    create_table :diseases do |t|
      t.string :name_eng
      t.string :name_ko
      t.string :description
      t.string :channel
      t.string :organ
      t.string :western_dx
      t.string :tcm_dx
      t.string :name_tcm
      t.timestamps null: false
    end
  end
  def down
    drop_table(:diseases, if_exists: true)
  end
end
