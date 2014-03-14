class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :identifier
      t.string :content
      t.string :link
      t.string :author
      t.integer :parent
      t.integer :points

      t.timestamps
    end
  end
end
