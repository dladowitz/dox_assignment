require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  test "Search Terms in Title Should Count Higher" do
    relevancy_list = Search.find_relevant_articles("Avengers")
    assert_equal(relevancy_list.first[:count], 6)
  end

  test "Search Terms in Body Should Count Lower" do
    relevancy_list = Search.find_relevant_articles("Avengers")
    assert_equal(relevancy_list.second[:count], 1)
  end

  test "Unfound Term Should Return No Results" do
    relevancy_list = Search.find_relevant_articles("Unfound Term")
    assert_equal(relevancy_list, [])
  end
end
