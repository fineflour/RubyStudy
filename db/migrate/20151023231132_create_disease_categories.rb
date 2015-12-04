class CreateDiseaseCategories < ActiveRecord::Migration
  def change
    create_table :disease_categories do |t|
      t.references :disease, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
