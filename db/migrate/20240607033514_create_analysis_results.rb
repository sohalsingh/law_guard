class CreateAnalysisResults < ActiveRecord::Migration[7.0]
  def change
    create_table :analysis_results do |t|
      t.references :contract, null: false, foreign_key: true
      t.text :risks
      t.text :summary

      t.timestamps
    end
  end
end
