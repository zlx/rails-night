class CreateActivityComments < ActiveRecord::Migration
  def change
    create_table :activity_comments do |t|
      t.integer :author_id
      t.text :subject
      t.integer :reply_to_id
      t.integer :activity_id

      t.timestamps
    end

  end
end
