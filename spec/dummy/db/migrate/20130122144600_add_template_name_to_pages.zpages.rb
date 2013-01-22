# This migration comes from zpages (originally 20130122144450)
class AddTemplateNameToPages < ActiveRecord::Migration
  def change
    add_column :zpages_pages, :template_name, :string
  end
end
