# This migration comes from semistatic (originally 20130122144450)
class AddTemplateNameToPages < ActiveRecord::Migration
  def change
    add_column :semistatic_pages, :template_name, :string
  end
end
