class AddYinorYangtoZangfu < ActiveRecord::Migration
  def change
    add_column :zangfus, :short_name, :string, :length => 2 
    add_column :zangfus, :channel, :string  
    add_column :zangfus, :five_element, :string  
    add_column :zangfus, :property, :string  
    add_column :zangfus, :emotion, :string  
    add_column :zangfus, :season, :string  
    add_column :zangfus, :western, :string  
    add_column :zangfus, :note, :string  
    add_column :zangfus, :yinyang, :string, :length => 1
    add_column :zangfus, :order, :integer  
    rename_column :herbalformulars, :channels, :channel  
    rename_column :herbs, :actions, :action
    rename_column :herbs, :notes, :note
  end
end
