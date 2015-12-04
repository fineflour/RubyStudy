class CreateSubindications < ActiveRecord::Migration
  def change
    create_table :subindications do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
