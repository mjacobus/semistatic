# This migration comes from zpages (originally 20130121193153)
class CreateZpagesPages < ActiveRecord::Migration
  def change
    create_table :zpages_pages do |t|
      t.string :title
      t.string :slug

      t.timestamps
    end
  end
end
