class CreateZangfus < ActiveRecord::Migration
  def change
    create_table :zangfus do |t|
      t.string :name_eng
      t.string :name_ko
      t.string :meridian_eng
      t.string :meridian_ko
      t.string :description

      t.timestamps null: false
    end
  end
end
