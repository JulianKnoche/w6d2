class ChangeUsers < ActiveRecord::Migration[5.2]
  def change
    # add column :users, :username, :string, null:false

    change_table :users do |t|
      t.remove :email, :name
      t.string :username, null: false
      t.index :username, unique: true
    end
  end
end
