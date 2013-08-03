class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.integer :author
      t.datetime :start_at
      t.text :summary

      t.timestamps
    end
  end
end
