class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :file_path

      t.timestamps
    end
  end
end
