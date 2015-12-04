class CreateHerbs < ActiveRecord::Migration
  def change
    create_table :herbs do |t|

      t.references :category, index: true, foreign_key: true
      t.string :name_eng
      t.string :name_ko
      t.string :name_la
      t.string :property
      t.string :nature
      t.string :channel

      t.timestamps null: false
    end
  end
end
