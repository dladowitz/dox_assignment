class Search < ActiveRecord::Base
  @debug = true
  @relevancy_list = []

  def self.find_relevant_articles(term)
    @relevancy_list = []

    Article.find_each do |article|
      term_count = self.get_term_count(article, term.downcase)
      self.add_term_count_to_relvancy_list(term_count) if term_count[:count] > 0
    end

    return @relevancy_list
  end

  private

  def self.get_term_count(article, term)
    term_count = {count: 0, article_id: article.id}

    # Words in the title are weighted 5 times heavier than words in the body
    body_words = article.body.downcase.split " "
    term_count = get_weighted_count(body_words, 1, term_count, term)

    title_words = article.title.downcase.split " "
    term_count = get_weighted_count(title_words, 5, term_count, term)

    return term_count
  end

  def self.get_weighted_count(words, weighting, term_count, search_term)
    words.each do |word|
      if word == search_term
        term_count[:count] += weighting
      end
    end

    return term_count
  end

  def self.add_term_count_to_relvancy_list(unsorted_term_count)
    return @relevancy_list << unsorted_term_count if @relevancy_list.empty?

    @relevancy_list.each_with_index do |sorted_term_count, index|
      if sorted_term_count[:count] >= unsorted_term_count[:count]
        if index == @relevancy_list.length - 1
          return @relevancy_list << unsorted_term_count
        end
      else
        last_sorted_items = @relevancy_list[index..-1]

        @relevancy_list[index] = unsorted_term_count

        @relevancy_list[(index+1)..-1] = last_sorted_items
        return
      end
    end
  end
end
