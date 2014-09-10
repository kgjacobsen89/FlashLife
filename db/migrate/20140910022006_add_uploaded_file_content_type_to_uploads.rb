class AddUploadedFileContentTypeToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :uploaded_file_content_type, :string
  end
end
