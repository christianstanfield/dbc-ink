class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, :last_name, :cohort, :dbc_location, :email, :password
      t.timestamps
    end
  end
end
