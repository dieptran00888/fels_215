class Category < ApplicationRecord
  has_many :lessons, dependent: :destroy
  has_many :words, dependent: :destroy

  validates :name, presence: true, length: {maximum: 20}
  validates :duration, presence: true, length: {maximum: 5},
    numericality: {greater_than_or_equal_to: 0, only_integer: true}
  validates :word_per_lesson, presence: true, length: {maximum: 3},
    numericality: {greater_than_or_equal_to: 0, only_integer: true}

  scope :sort, -> {order created_at: :desc}
  scope :search_categories, -> search {where "name LIKE ?",
    "%#{search}%"}

  class << self
    def search search
      if search
        search_categories search
      else
        Category.all
      end
    end
  end
end
