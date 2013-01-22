class CreateZpagesAttributes < ActiveRecord::Migration
  def change
    create_table :zpages_attributes do |t|
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
    add_index :zpages_attributes, :page_id
  end
end
