class AddActiveToIndications < ActiveRecord::Migration
  def change
    add_column :indications, :active, :boolean, default: true
  end
end
