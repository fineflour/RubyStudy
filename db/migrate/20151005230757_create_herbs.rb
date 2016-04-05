class CreateHerbs < ActiveRecord::Migration
  def up 
    create_table :herbs do |t|
      t.references :category, index: true, foreign_key: true
      t.string :name_eng
      t.string :name_ko
      t.string :name_la
      t.string :property
      t.string :nature
      t.string :channel
      t.string :contraindication
      t.string :westernuse 
      t.string :qty      
      t.string :action
      t.string :note
      t.timestamps null: false    

    end
  end
  def down
    drop_table(:herbs, if_exists: true)
  end
end
