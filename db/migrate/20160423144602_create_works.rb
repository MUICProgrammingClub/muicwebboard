class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.text :category
      t.text :type
      t.text :content
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
