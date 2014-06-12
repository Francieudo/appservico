class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :id_photo, null:false
      t.string :name, null:false
      t.string :title, null:false
      t.text :body, null:false

      t.timestamps
    end
  end
end
