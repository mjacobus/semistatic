class AddTemplateNameToPages < ActiveRecord::Migration
  def change
    add_column :semistatic_pages, :template_name, :string
  end
end
