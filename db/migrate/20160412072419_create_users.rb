class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :string
      t.string :last_name
      t.string :string
      t.string :student_id
      t.string :integer
      t.string :phone_num
      t.string :string
      t.string :password
      t.string :string

      t.timestamps null: false
    end
  end
end
