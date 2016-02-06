class AddColToUser < ActiveRecord::Migration
  def change
    add_column :users, :accessible_datum, :string
  end
end
