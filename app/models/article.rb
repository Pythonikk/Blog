class Article < ApplicationRecord
  # adds the association with comment model
  # dependent: :destroy ensures that if an article is deleted, its comments will be deleted.
  has_many :comments, dependent: :destroy
  # Active Record automatically defines model attributes for every table column,
  # so :title and :body don't need to be declared here.
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
