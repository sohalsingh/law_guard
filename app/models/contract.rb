class Contract < ApplicationRecord
  belongs_to :user
  has_many :suggestions
  has_many :risks, through: :suggestions

  has_one_attached :file

  validates :file, presence: true
end
