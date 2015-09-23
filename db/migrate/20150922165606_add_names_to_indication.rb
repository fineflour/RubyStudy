class AddNamesToIndication < ActiveRecord::Migration
  def change
    add_column :indications, :name_eng, :string
    add_column :indications, :name_ko, :string
  end
end
