# This migration comes from zpages (originally 20130122165327)
class CreateZpagesParts < ActiveRecord::Migration
  def change
    create_table :zpages_parts do |t|
      t.string :title
      t.references :page
      t.text :value

      # file fields
      t.string   :file_file_name
      t.integer  :file_file_size
      t.string   :file_content_type
      t.datetime :file_updated_at

      t.timestamps
    end
    add_index :zpages_parts, :page_id
  end
end
