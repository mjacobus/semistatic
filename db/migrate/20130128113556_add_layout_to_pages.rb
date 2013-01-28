class AddLayoutToPages < ActiveRecord::Migration
  def change
    add_column :semistatic_pages, :layout, :string
  end
end
