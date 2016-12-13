module CategoryUtils
  extend ActiveSupport::Concern

  included do
    before_action :load_categories
  end

  def load_categories
    @categories = Category.all.map{|category| [category.name, category.id]}
  end

  def words_count
    @words_count = Hash.new
    @categories.each do |category|
      @words_count[category.id] = category.words.
        learned_words(current_user.id, category.id).size
    end
  end
end
