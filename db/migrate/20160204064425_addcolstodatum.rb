class Addcolstodatum < ActiveRecord::Migration
  def change
    add_column :data, :title, :string
    add_column :data, :firstname, :string
    add_column :data, :surname, :string
    add_column :data, :address, :text
    add_column :data, :email, :string
    add_column :data, :telephone, :string
    add_column :data, :amount, :string
    add_column :data, :entry_date, :date
    add_column :data, :interest_amount, :string
    add_column :data, :trailer_comm, :string
    add_column :data, :initial_comm, :string
    add_column :data, :maturity_date, :date
    add_column :data, :anniversary_date_1, :date
    add_column :data, :anniversary_date_2, :date
    add_column :data, :anniversary_date_3, :date
    add_column :data, :pensionor_cash, :string
  end
end
