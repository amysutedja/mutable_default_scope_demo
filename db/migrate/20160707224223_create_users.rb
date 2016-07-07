class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.datetime :deleted_at
    end
  end
end
