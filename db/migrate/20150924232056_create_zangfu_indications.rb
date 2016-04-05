class CreateZangfuIndications < ActiveRecord::Migration
  def up
    create_table :zangfu_indications do |t|
      t.references :zangfu, index: true, foreign_key: true
      t.references :indication, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
  def down
    drop_table(:zangfu_indications, if_exists: true)
  end

end
