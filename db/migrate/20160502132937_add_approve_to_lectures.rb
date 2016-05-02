class AddApproveToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :approve, :boolean
  end
end
