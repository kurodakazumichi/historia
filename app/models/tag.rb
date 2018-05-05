class Tag < ApplicationRecord
  has_many :technologies, through: :technology_tags
  has_many :technology_tags, dependent: :destroy
end
