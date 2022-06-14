class DeviseCreateOperators < ActiveRecord::Migration[7.0]
  def change
    create_table :operators do |t|
      ## Database authenticatable
      t.string :email, null: false, default: ''
      t.string :username, default: ''
      t.string :encrypted_password, null: false, default: ''

      t.datetime :discarded_at
      t.timestamps null: false
    end

    add_index :operators, :username, unique: true
    add_index :operators, :discarded_at
  end
end
