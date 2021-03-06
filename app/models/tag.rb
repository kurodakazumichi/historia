class Tag < ApplicationRecord
  has_many :technologies, through: :technology_tags
  has_many :technology_tags, dependent: :destroy

  default_scope -> { order(:name) }

  validates :name, presence:true, length:{maximum:20}
end
