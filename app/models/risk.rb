class Risk < ApplicationRecord
    has_many :suggestions
    has_many :lawyers, through: :suggestions
  
    validates :description, presence: true
    validates :level, presence: true
  end
  