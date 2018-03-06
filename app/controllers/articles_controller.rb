class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

def index
  @articleS = Article.all
end

def edit
  @article = Article.find(params[:id]) #params is a hash.!!!
  end

  def update
    @article = Article.find(params[:id]) #params is a hash.!!!
    if @article.update(article_params)
      flash[:notice] = "Article was updated"
      redirect_to article_path(@article)
    end
  end




  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'Article was saved BOOM' # we added an enrty in application GHTML wrapper to use this
      redirect_to article_path(@article)
    else
      render :new
   end
  end

def show
@article = Article.find(params[:id]) #params is a hash.!!!
end

def destroy
@article = Article.find(params[:id]) #params is a hash.!!!
@article.destroy
flash[:notice] = 'The article is now gone mo fo'
redirect_to articles_path
end


  private

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
