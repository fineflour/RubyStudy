class CreatePointIndications < ActiveRecord::Migration
  def up
    create_table :point_indications do |t|
      t.references :point, index: true, foreign_key: true
      t.references :indication, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
  def down
    drop_table(:point_indications, if_exists: true)
  end

end
