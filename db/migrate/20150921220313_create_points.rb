class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.string :name_eng
      t.string :name_ko
      t.string :location

      t.timestamps null: false
    end
  end
end
