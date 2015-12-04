class AddContraindocationToHerb < ActiveRecord::Migration
  def change
    add_column :herbs, :contraindication, :string
  end
end
