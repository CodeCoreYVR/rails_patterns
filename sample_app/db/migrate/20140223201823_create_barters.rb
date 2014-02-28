class CreateBarters < ActiveRecord::Migration
  def change
    create_table :barters do |t|
      t.integer :barter_id

      t.string :title
      t.string :offerring
      t.string :accepting

      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
