class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  serialize :accessible_datum
  has_many :datum, dependent: :destroy

  def accessible_datums
    Datum.where(id: accessible_datum)
  end

  def remaining_datums
    Datum.where('id NOT IN (?)',accessible_datums.map(&:id))
  end

  def self.normal_users
    where(admin: false)
  end
end
