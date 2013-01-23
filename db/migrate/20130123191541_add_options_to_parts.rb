class AddOptionsToParts < ActiveRecord::Migration
  def change
    add_column :zpages_parts, :options, :text
  end
end
