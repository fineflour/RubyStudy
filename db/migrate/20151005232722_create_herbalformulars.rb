class CreateHerbalformulars < ActiveRecord::Migration
  def change
    create_table :herbalformulars do |t|

      t.references :category, index: true, foreign_key: true
      t.integer :subcategory
      t.string :name_eng
      t.string :name_ko
      t.string :name_la
      t.string :pattern
      t.string :action
      t.string :tongue
      t.string :pulse
      t.string :contraindication
      t.string :preparation

      t.timestamps null: false
    end
  end
end
