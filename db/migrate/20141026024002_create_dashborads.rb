class CreateDashborads < ActiveRecord::Migration
  def change
    create_table :dashborads do |t|
      t.string :user
      t.string :set

      t.timestamps
    end
  end
end
