class CreateManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :managers do |t|
      t.string :name
      t.string :country
      t.string :fave_team
      t.belongs_to :user

      t.timestamps
    end
  end
end
