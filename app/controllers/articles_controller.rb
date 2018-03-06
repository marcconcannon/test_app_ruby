class ArticlesController < ApplicationController
  def new
    @article = Article.new
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



  private

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
