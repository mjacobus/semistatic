# This migration comes from semistatic (originally 20130123191541)
class AddOptionsToParts < ActiveRecord::Migration
  def change
    add_column :semistatic_parts, :options, :text
  end
end
