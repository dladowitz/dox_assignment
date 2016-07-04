class ArticlesController < ApplicationController
  before_action :load_article, only: :show
  autocomplete :article, :title, :full => true

  def index
    @featured_article = Article.featured.limit(1).first
    @articles = Article.published.where.not(id: @featured_article).
      paginate(page: params[:page], per_page: 5)

      respond_to do |format|
        format.html
        format.js
      end
  end

  # def autocomplete
  #   puts "Hitting autocomplete action..................."
  # end

  def show
  end

  # Generally I like to avoid using non-restfull controller actions like this,
  # but in this case I think it's better to use a new action than build a
  # whole controller. Some people would disagree.
  def search
    puts "You're searching for: #{params[:title]}"
    search_term = params[:title]
    @articles = Article.where("title LIKE ? OR body LIKE ?", "%#{search_term}%", "%#{search_term}%").paginate(page: params[:page], per_page: 5)

    respond_to do |format|
      format.js { render "index" }
    end
  end
end
