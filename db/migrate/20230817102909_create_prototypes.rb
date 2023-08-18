class CreatePrototypes < ActiveRecord::Migration[7.0]
  def change
    create_table :prototypes do |t|
      t.string :protoname, null: false
      t.string :catchcopy, null: false
      t.text :concept, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
