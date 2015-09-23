class RemoveNameFromIndication < ActiveRecord::Migration
  def change
    remove_column :indications, :name, :string
  end
end
