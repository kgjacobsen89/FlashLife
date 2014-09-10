class AddUploadedFileFileNameToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :uploaded_file_file_name, :string
  end
end
