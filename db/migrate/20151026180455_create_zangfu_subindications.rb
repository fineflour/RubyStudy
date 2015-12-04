class CreateZangfuSubindications < ActiveRecord::Migration
  def change
    create_table :zangfu_subindications do |t|
      t.references :zangfu, index: true, foreign_key: true
      t.references :subindication, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
