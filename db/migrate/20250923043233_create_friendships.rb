class CreateFriendships < ActiveRecord::Migration[8.0]
  def change
    create_table :friendships do |t|
      t.references :user, null: false, foreign_key: true
      ### The 'references' is redundant, what's important is the the foreign key
      ### understands what table it's referring to.
      ### The verbose syntax is not needed for the user_id column because
      ### Rails can infer the what table to link the foreign key to (user -> users)
      ## t.references :friend, references: :users, foreign_key: { to_table: :users }
      t.references :friend, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
