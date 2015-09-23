class CreateDiseases < ActiveRecord::Migration
  def change
    create_table :diseases do |t|
      t.string :name_eng
      t.string :name_ko
      t.string :description

      t.timestamps null: false
    end
  end
end
