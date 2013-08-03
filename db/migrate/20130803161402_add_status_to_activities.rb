class AddStatusToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :status, :integer
  end
end
