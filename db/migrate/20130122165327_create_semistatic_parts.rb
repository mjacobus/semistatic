class CreateSemistaticParts < ActiveRecord::Migration
  def change
    create_table :semistatic_parts do |t|
      t.string :name
      t.references :page
      t.text :value

      # file fields
      t.string   :file_file_name
      t.integer  :file_file_size
      t.string   :file_content_type
      t.datetime :file_updated_at

      t.timestamps
    end
    add_index :semistatic_parts, :page_id
  end
end
