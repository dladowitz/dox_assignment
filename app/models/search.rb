class Search < ActiveRecord::Base
  @debug = true
  @relevancy_list = []

  def self.find_relevant_articles(term)
    @relevancy_list = []

    puts "Term: #{term}" if @debug
    Article.find_each do |article|
      puts "Current Article: #{article.title}" if @debug

      term_count = self.get_term_count(article, term.downcase)
      self.add_term_count_to_relvancy_list(term_count) if term_count[:count] > 0
    end

    puts "\n\n================= Final Relevancy List =================\n#{@relevancy_list}" if @debug
    return @relevancy_list
  end

  def self.get_term_count(article, term)
    term_count = {count: 0, article_id: article.id}
    words = article.body.downcase.split " "

    words.each do |word|
      if word == term
        term_count[:count] += 1
        puts "Word: #{word}, Count: #{term_count[:count]}" if @debug
      end
    end

    puts "Term Count: #{term_count}" if @debug
    return term_count
  end

  def self.add_term_count_to_relvancy_list(unsorted_term_count)
    puts "Unsorted Term Count: #{unsorted_term_count}" if @debug
    # puts "@relevancy_list: #{@relevancy_list}" if @debug

    return @relevancy_list << unsorted_term_count if @relevancy_list.empty?

    @relevancy_list.each_with_index do |sorted_term_count, index|
      if sorted_term_count[:count] >= unsorted_term_count[:count]
        # puts "Sorted Term Count Larger: #{sorted_term_count[:count]}" if @debug
      else
        puts "Sorted Term Count Smaller or Eq: #{sorted_term_count[:count]}" if @debug
        last_sorted_items = @relevancy_list[index..-1]

        puts "Adding to index: #{index}" if @debug
        @relevancy_list[index] = unsorted_term_count

        @relevancy_list[(index+1)..-1] = last_sorted_items
        puts "Returing with @relevancy_list: #{@relevancy_list}" if @debug
        return
      end
    end

  end
end
