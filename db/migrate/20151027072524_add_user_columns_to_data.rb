class AddUserColumnsToData < ActiveRecord::Migration
    def up
      add_column :data, :user_id, :integer
    end

    def down
      remove_column :data, :user_id
    end
end
