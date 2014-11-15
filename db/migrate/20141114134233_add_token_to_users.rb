class AddTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :token, :string

    User.all.each {|user| user.update(token: SecureRandom.urlsafe_base64) }
  end
end
