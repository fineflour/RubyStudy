class CreateIndicationSubindications < ActiveRecord::Migration
  def up
    create_table :indication_subindications do |t|
      t.references :indication, index: true, foreign_key: true
      t.references :subindication, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
  def down
    drop_table( :indication_subindications, if_exists: true)
  end

end
