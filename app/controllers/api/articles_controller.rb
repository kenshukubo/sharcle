class Api::ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render json: @articles.map { |article| { id: article.id, og_title: article.og_title } } 
  end
end