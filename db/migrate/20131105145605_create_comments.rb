class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :publication_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
    add_index :comments, [:user_id, :publication_id]
  end
end
