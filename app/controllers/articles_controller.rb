class ArticlesController < ApplicationController
  # define a action the new page to create a new article [form]
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  # index page will show all the articles
  def index
    @articles = Article.all
  end

    # after the article submit redirect to this show page
  def show
    @article = Article.find(params[:id])
  end

  # action create
  def create
    # render show the parameters
    # render plain: params[:article].inspect

    # we need to change the create action to use
    #
    ## params[:article] contains the attributes we're interested in
    @article = Article.new(article_params)
    ## saving the model in the database .save will return boolean
    # if the save saved redirectTo article page
    if @article.save
      redirect_to @article
    else
      # else render page new
      render 'new'
    end
  end

  ## to update the article , if success , redirect article page ,otherwise , return edit page
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end


  private
  def article_params
    params.require(:article).permit(:title,:text)
  end
end
