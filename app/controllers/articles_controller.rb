class ArticlesController < ApplicationController
  # set_article is a private method that is called before any of the actions
  # injects the @article variable with the article that is being requested
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article  = Article.new(article_params)
    # ttemporarily set the first userid that exists in the database while waiting for the authentication functionality
    @article.user = current_user
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path, status: :see_other
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own articles"
      redirect_to @article
    end
  end
end