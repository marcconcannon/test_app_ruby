class UsersController < ApplicationController

def new
 @user = User.new
end

def create
  # render plain: params[:article].inspect
  #debugger # allows me to step though in server console
  @user = User.new(user_params)
#  @article.user = User.first
  if @user.save
    flash[:notice] = 'User was created BOOM' # we added an enrty in application GHTML wrapper to use this
    redirect_to articles_path
  else
    render :new
 end
end

def show
  @user = User.find(params[:id] )
  @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
end


def index
 @users = User.all
end


def edit
  @user = User.find(params[:id] )
end

def update
    @user = User.find(params[:id] )
  if @user.update(user_params)
    flash[:notice] = 'User was updtaed BOOM' # we added an enrty in application GHTML wrapper to use this
    redirect_to articles_path
  else
    render :edit
 end

end


private
def user_params
  params.require(:user).permit(:username, :email, :password)
end



end
