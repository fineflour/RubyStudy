class AddChanneltoHerbalformular < ActiveRecord::Migration
  def change
    add_column :herbalformulars, :subcategory_id, :integer
    add_column :herbalformulars, :channels, :string
    add_column :herbalformulars, :westernuse, :string
    add_column :herbalformulars, :note, :string
    remove_column :herbalformulars, :subcategory, :string
  end
end
