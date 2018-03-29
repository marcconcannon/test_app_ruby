class ArticlesController < ApplicationController
  before_action :set_marcs_article, only:[:edit, :update, :show,:destroy]

  def new
    @article = Article.new
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def edit
    #  @article = Article.find(params[:id]) # params is a hash.!!!
    #line above no longer needed due to ren bfore command at top of file

    end

  def update
    #  @article = Article.find(params[:id]) # params is a hash.!!!
    #line above no longer needed due to ren bfore command at top of file

    if @article.update(article_params)
      flash[:notice] = 'Article was updated'
      redirect_to article_path(@article)
    end
  end

  def create
    # render plain: params[:article].inspect
    #debugger # allows me to step though in server console
    @article = Article.new(article_params)
  #  @article.user = User.first
    if @article.save
      flash[:notice] = 'Article was saved BOOM' # we added an enrty in application GHTML wrapper to use this
      redirect_to article_path(@article)
    else
      render :new
   end
  end

  def show
  #  @article = Article.find(params[:id]) # params is a hash.!!!
  #line above no longer needed due to ren bfore command at top of file

  end

  def destroy #
    #  @article = Article.find(params[:id]) # params is a hash.!!!
    #line above no longer needed due to ren bfore command at top of file    @article.destroy
    @article.destroy
    flash[:notice] = 'The article is now gone mo fo'
    redirect_to articles_path
  end

  private

  def set_marcs_article
    if ( @article = Article.find(params[:id]))

   else
    @article = null
    end
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
