class Answer < ApplicationRecord
  belongs_to :word, optional: true
  
  has_many :results
  has_many :lessons, through: :results

  validates :content, presence: true, length: {maximum: 10}
end
