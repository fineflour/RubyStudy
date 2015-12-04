class FixColumnNameForSubindication < ActiveRecord::Migration
  def change
    rename_column :subindications, :name, :name_eng
    add_column :subindications, :name_ko, :string
  end
end
