class CreateDiseaseZangfus < ActiveRecord::Migration
  def change
    create_table :disease_zangfus do |t|
      t.references :disease, index: true, foreign_key: true
      t.references :zangfu, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
