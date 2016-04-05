class CreateZangfus < ActiveRecord::Migration
  def up
    create_table :zangfus do |t|
      t.string :name_eng
      t.string :name_ko
      t.string :channel_eng
      t.string :channel_ko
      t.string :description
      t.string :short_name, :string, :length => 2 
      t.string :channel, :string  
      t.string :five_element, :string  
      t.string :property, :string  
      t.string :emotion, :string  
      t.string :season, :string  
      t.string :western, :string  
      t.string :note, :string  
      t.string :yinyang, :string, :length => 1
      t.string :order, :integer  
      t.timestamps null: false
    end
  end
  def down
    drop_table(:zangfus, if_exists: true)
  end
end
