class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.references :user, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true
      t.references :instructor, index: true, foreign_key: true
      t.references :term, index: true, foreign_key: true
      t.text :lecture_name
      t.text :chapter
      t.text :description

      t.timestamps null: false
    end
  end
end
