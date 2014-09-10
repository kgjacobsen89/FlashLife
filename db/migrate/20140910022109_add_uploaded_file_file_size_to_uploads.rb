class AddUploadedFileFileSizeToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :uploaded_file_file_size, :integer
  end
end
