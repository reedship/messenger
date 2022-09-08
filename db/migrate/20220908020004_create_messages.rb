class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages, if_not_exists: true do |t|
      t.text :content
      t.references :conversation, null: false, index: true
      t.references :user, null: false, index: true
      t.timestamps
    end
  end
end
