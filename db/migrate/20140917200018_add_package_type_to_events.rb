class AddPackageTypeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :package_type, :string
  end
end
