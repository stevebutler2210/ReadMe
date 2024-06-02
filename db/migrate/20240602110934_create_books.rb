class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :external_id, null: false
      t.string :title, null: false
      t.string :authors, array: true, default: []
      t.string :thumbnail_url

      t.timestamps
    end
  end
end
