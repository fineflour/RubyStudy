class ChangeColumnstoDisease < ActiveRecord::Migration
  def change
    add_column :diseases, :channel, :string
    add_column :diseases, :organ, :string
    add_column :diseases, :western_dx, :string
    add_column :diseases, :tcm_dx, :string
    add_column :diseases, :name_tcm, :string
  end
end
