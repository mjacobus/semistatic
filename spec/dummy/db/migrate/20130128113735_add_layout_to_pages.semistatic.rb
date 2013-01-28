# This migration comes from semistatic (originally 20130128113556)
class AddLayoutToPages < ActiveRecord::Migration
  def change
    add_column :semistatic_pages, :layout, :string
  end
end
