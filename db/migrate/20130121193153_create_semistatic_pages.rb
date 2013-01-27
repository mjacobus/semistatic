class CreateSemistaticPages < ActiveRecord::Migration
  def change
    create_table :semistatic_pages do |t|
      t.string :title
      t.string :slug

      t.timestamps
    end
  end
end
