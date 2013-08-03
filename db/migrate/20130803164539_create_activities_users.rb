class CreateActivitiesUsers < ActiveRecord::Migration
  def change
    create_join_table :activities, :users do |t|
      t.index :activity_id
      t.index :user_id
    end
  end
end
