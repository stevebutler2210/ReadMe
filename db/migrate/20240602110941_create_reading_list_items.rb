class CreateReadingListItems < ActiveRecord::Migration[7.1]
  def change
    create_join_table :books, :users, table_name: :reading_list_items do |t|
      t.index :book_id
      t.index :user_id
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
