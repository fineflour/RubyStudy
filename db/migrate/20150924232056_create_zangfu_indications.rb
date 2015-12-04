class CreateZangfuIndications < ActiveRecord::Migration
  def change
    create_table :zangfu_indications do |t|
      t.references :zangfu, index: true, foreign_key: true
      t.references :indication, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
