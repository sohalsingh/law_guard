class Lawyer < ApplicationRecord
    has_many :suggestions
    has_many :risks, through: :suggestions
  
    validates :name, presence: true
    validates :specialization, presence: true
    validates :contact_details, presence: true
  end
  