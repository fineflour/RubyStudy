class CreateFormularIndications < ActiveRecord::Migration
  def change
    create_table :formular_indications do |t|
      t.references :herbalformular, index: true, foreign_key: true
      t.references :indication, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
