class AddSummaryToContracts < ActiveRecord::Migration[7.0]
  def change
    add_column :contracts, :summary, :text
  end
end
