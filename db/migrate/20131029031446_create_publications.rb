class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.text :content
      t.integer :user_id

      t.timestamps
    end
    add_index :publications, [:user_id, :created_at]
  end
end
