class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      # bodyが空にならないようにnull制約をfalseに
      t.text :body, null: false
      t.references :user, null: false, foreign_key: true
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
