class AddAttachmentFileToData < ActiveRecord::Migration
  def self.up
    change_table :data do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :data, :file
  end
end
