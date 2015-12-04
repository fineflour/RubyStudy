class ChangeColumnstoZangfu < ActiveRecord::Migration
  def change
    rename_column :zangfus, :meridian_ko, :channel_ko  
    remove_column :zangfus, :meridian_eng  
    rename_column :zangfus, :channel, :channel_eng  

  end
end
