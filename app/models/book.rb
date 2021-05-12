class Book < ApplicationRecord
  belongs_to :author
  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres

  has_one_attached :cover

  validates :title, presence: true
  validate :valid_title?

  def genres_to_csv
    genres.map { |genre| genre.name }.join(", ")
  end

  def valid_title?
    return title != nil && !title.strip.empty?
  end
end
