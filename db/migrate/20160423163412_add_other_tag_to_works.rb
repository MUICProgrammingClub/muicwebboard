class AddOtherTagToWorks < ActiveRecord::Migration
  def change
    add_column :works, :other_tag, :text
  end
end
