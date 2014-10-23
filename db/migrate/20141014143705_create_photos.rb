class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :photo_url
      t.belongs_to :album
      t.timestamps
    end
  end
end
