class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :lect_name
      t.string :string
      t.string :term_id
      t.string :string
      t.string :chapter
      t.string :string
      t.string :description
      t.string :string

      t.timestamps null: false
    end
  end
end
