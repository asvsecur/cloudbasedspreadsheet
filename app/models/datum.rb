class Datum < ActiveRecord::Base
  has_attached_file :file,
                    :url  => "/assets/users/:id/:style/:basename.:extension",
                    :path => ":rails_root/private/assets/products/:id/:style/:basename.:extension"

  do_not_validate_attachment_file_type :file
  validates_attachment_size :file, :less_than => 5.megabytes
  validates :name, presence: true
  belongs_to :user
end
