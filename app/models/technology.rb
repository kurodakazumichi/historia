class Technology < ApplicationRecord
  has_many :histories
  has_many :tags, through: :technology_tags

  validates(:name , presence: true, length:{ maximum: 50})
  validates(:year , numericality: {allow_blank: false, greater_than: 1900})
  validates(:month, numericality: {allow_blank: true, greater_than: 0, less_than:13})
  validates(:day  , numericality: {allow_blank: true, greater_than: 0, less_than:32})
end
