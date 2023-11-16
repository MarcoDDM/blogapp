class AddEncryptedPasswordToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :encrypted_password, :string
  end
end
