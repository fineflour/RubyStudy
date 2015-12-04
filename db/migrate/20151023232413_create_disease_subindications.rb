class CreateDiseaseSubindications < ActiveRecord::Migration
  def change
    create_table :disease_subindications do |t|
      t.references :disease, index: true, foreign_key: true
      t.references :subindication, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
