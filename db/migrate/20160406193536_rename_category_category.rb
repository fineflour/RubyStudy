class RenameCategoryCategory < ActiveRecord::Migration
  def change
    rename_column :categories, :category, :cgroup
  end
end
