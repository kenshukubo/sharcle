class StaticPagesController < ApplicationController
  def home
    @articles = Article.all.order(created_at: :desc).page(params[:page])
  end
end