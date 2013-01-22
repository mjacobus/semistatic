class CreateZpagesPages < ActiveRecord::Migration
  def change
    create_table :zpages_pages do |t|
      t.string :title
      t.string :slug

      t.timestamps
    end
  end
end
