class AddSmallUrlToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :small_url, :string
  end
end
