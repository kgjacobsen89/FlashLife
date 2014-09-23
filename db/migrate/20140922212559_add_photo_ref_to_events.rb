class AddPhotoRefToEvents < ActiveRecord::Migration
  def change
  	add_reference :photos, :event, index: true
  end
end
