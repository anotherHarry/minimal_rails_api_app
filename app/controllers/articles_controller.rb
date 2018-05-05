class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :update, :destroy]

  def index
    @articles = Article.all
    json_response(@articles)
  end

  def show
    json_response(@article)
  end

  def create
    @article = Article.create!(articles_params)
    json_response(@article, :created)
  end

  def update
    @article.update(articles_params)
    head :no_content
  end

  def destroy
    @article.destroy
    head :no_content
  end

  private
  def articles_params
    params.permit(:title, :text)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
