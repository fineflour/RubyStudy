class CreateIndicationSubindications < ActiveRecord::Migration
  def change
    create_table :indication_subindications do |t|
      t.references :indication, index: true, foreign_key: true
      t.references :subindication, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
