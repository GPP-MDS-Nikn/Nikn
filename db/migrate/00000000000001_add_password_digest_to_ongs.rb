class AddPasswordDigestToOngs < ActiveRecord::Migration
  def change
    add_column :ongs, :password_digest, :string
  end
end