class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :skills_users, id: false do |t|
      t.belongs_to :skill, index: true
      t.belongs_to :user, index: true
    end

    create_table :skills_wishes, id: false do |t|
      t.belongs_to :skill, index: true
      t.belongs_to :wish, index: true
    end
  end
end
