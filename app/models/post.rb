class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 4 }
  validates_uniqueness_of :title, :case_sensitive => false
  validates :content, presence: true, length: { maximum:  2960 }
end
