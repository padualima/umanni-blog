class Post < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  belongs_to :category
  has_rich_text :content
  has_many :comments, dependent: :destroy
  pg_search_scope :search,
  against: %i[title subtitle body],
  associated_against: { comments: %i[body] }
end
