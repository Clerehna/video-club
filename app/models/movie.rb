class Movie < ApplicationRecord
  belongs_to :director

  validates :title, :genre, presence: true
end
