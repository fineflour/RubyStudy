class AddActivetoUser < ActiveRecord::Migration
  def change
    add_column :users, :active, :bit
  end
end
