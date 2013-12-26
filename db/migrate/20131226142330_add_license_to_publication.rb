class AddLicenseToPublication < ActiveRecord::Migration
  def change
  	add_column :publications, :license, :integer, default: 4
  end
end
