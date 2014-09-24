class AddUploadRefToEvents < ActiveRecord::Migration
  def change
    add_reference :uploads, :event, index: true
  end
end
