class CreateLawyers < ActiveRecord::Migration[7.0]
  def change
    create_table :lawyers do |t|
      t.string :name
      t.string :specialization
      t.string :contact_details

      t.timestamps
    end
  end
end
