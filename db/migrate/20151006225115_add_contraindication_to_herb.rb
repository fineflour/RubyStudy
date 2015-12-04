class AddContraindicationToHerb < ActiveRecord::Migration
  def change
    add_column :herbs, :contraindication, :string
    add_column :herbs, :westernuse, :string
    add_column :herbs, :qty, :string
    add_column :herbs, :actions, :string
    add_column :herbs, :notes, :string
  end
end
