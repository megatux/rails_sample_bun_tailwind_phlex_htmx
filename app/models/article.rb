class Article < ApplicationRecord
  validates :name, :details, presence: true
end
