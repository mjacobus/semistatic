class AddOptionsToParts < ActiveRecord::Migration
  def change
    add_column :semistatic_parts, :options, :text
  end
end
