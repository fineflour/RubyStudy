class CreateHerbIndications < ActiveRecord::Migration
  def change
    create_table :herb_indications do |t|
      t.references :herb, index: true, foreign_key: true
      t.references :indication, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
