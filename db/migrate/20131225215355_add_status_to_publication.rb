class AddStatusToPublication < ActiveRecord::Migration
  def change
    add_column :publications, :status, :boolean, default: false
  end
end
