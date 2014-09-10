class AddUploadedFileUpdatedAtToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :uploaded_file_updated_at, :datetime
  end
end
