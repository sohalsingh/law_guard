class Suggestion < ApplicationRecord
  belongs_to :risk
  belongs_to :lawyer
  belongs_to :contract
end
