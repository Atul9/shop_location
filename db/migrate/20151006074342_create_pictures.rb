class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.attachment :shop_image
      t.belongs_to :shop

      t.timestamps null: false
    end
  end
end
