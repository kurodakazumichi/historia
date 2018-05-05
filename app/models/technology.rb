class Technology < ApplicationRecord
  has_many :histories
  has_many :tags, through: :technology_tags
  has_many :technology_tags

  validates(:name , presence: true, length:{ maximum: 50})
  validates(:year , numericality: {allow_blank: false, greater_than: 1900})
  validates(:month, numericality: {allow_blank: true, greater_than: 0, less_than:13})
  validates(:day  , numericality: {allow_blank: true, greater_than: 0, less_than:32})

  def save_tags(tags)

    current_tags = self.tags.pluck(:name)
    old_tags = current_tags - tags;
    new_tags = tags - current_tags;

    # destroy old tags
    old_tags.each do |name|
      self.tags.delete Tag.find_by(name: name)
    end

    # create new tags
    new_tags.each do |name|
      next if name.empty?
      new_tag = Tag.find_or_create_by(name: name)
      self.tags << new_tag
    end

  end
end
