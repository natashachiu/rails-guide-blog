class ArticlesController < ApplicationController
  # action
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new 
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      # redirect_to makes a new request
      # needed after mutating the db or application state
      redirect_to @article
    else
      # renders the specified view for the current request
      render :new
    end
  end

  # fetch article from database and store in @article
  def edit
    @article = Article.find(params[:id])
  end

  # fetch article from database and updates it with filtered form data
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else 
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
    # filter params
    def article_params
      params.require(:article).permit(:title, :body)
    end
  
end
