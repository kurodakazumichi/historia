class History < ApplicationRecord
  belongs_to :technology
  validates(:year , numericality: {allow_blank: true, greater_than: 1900})
  validates(:month, numericality: {allow_blank: true, greater_than: 0, less_than:13})
  validates(:day  , numericality: {allow_blank: true, greater_than: 0, less_than:32})  
end
