class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.string :name_eng
      t.string :name_ko
      t.string :category
      t.integer :level
      t.integer :uplevel_id

      t.timestamps null: false
    end
  end 
  
  def down
    DROP TABLE IF EXIST categories
  end
end
