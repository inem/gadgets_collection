class CreateGadgets < ActiveRecord::Migration
  def change
    create_table :gadgets do |t|
      t.references :user
      t.string :name
      t.string :image_uid
      t.timestamps
    end
  end
end
