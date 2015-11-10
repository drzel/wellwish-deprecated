class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :tools_users, id: false do |t|
      t.belongs_to :tool, index: true
      t.belongs_to :user, index: true
    end

    create_table :tools_wishes, id: false do |t|
      t.belongs_to :tool, index: true
      t.belongs_to :wish, index: true
    end
  end
end
