# This migration comes from zpages (originally 20130123191541)
class AddOptionsToParts < ActiveRecord::Migration
  def change
    add_column :zpages_parts, :options, :text
  end
end
