class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name_eng
      t.string :name_ko
      t.string :category
      t.integer :level
      t.integer :uplevel_id

      t.timestamps null: false
    end
  end
end
