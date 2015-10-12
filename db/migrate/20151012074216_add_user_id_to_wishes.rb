class AddUserIdToWishes < ActiveRecord::Migration
  def change
    add_reference :wishes, :user, index: true
  end
end
