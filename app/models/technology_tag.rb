class TechnologyTag < ApplicationRecord
  belongs_to :technology
  belongs_to :tag

  validates :technology_id, presence:true
  validates :tag_id, presence:true
end
