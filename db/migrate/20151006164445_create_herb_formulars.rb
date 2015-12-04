class CreateHerbFormulars < ActiveRecord::Migration
  def change
    create_table :herb_formulars do |t|
      t.references :herb, index: true, foreign_key: true
      t.references :herbalformular, index: true, foreign_key: true
      t.string :qty
      t.string :function

      t.timestamps null: false
    end
  end
end
