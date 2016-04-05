class CreateHerbalformulars < ActiveRecord::Migration
  def change
    create_table :herbalformulars do |t|

      t.references :category, index: true, foreign_key: true
      #t.references :subcategory, index: true, foreign_key: true
      t.string :name_eng
      t.string :name_ko
      t.string :name_la
      t.string :pattern
      t.string :action
      t.string :tongue
      t.string :pulse
      t.string :contraindication
      t.string :preparation
      t.string :channel
      t.string :westernuse
      t.string :note
      t.timestamps null: false
    end
  end
end
