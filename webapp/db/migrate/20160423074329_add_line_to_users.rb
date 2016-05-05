class AddLineToUsers < ActiveRecord::Migration
  def change
    add_column :users, :line, :text
  end
end
