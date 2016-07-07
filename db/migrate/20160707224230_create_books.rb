class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.references :user, foreign_key: true
      t.boolean :deleted
    end
  end
end
