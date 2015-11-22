class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :siteurl
      t.string :blogname
      t.text :blogdescription
      t.integer :startofweek

      t.timestamps
    end
  end
end
