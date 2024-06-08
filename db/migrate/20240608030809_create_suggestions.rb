class CreateSuggestions < ActiveRecord::Migration[7.0]
  def change
    create_table :suggestions do |t|
      t.references :risk, null: false, foreign_key: true
      t.references :lawyer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
