class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.references :users, foreign_key: true
      t.datetime :deleted_at
    end
  end
end
