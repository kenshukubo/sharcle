class StaticPagesController < ApplicationController
  def home
    @articles = Article.all.order(created_at: :desc).page(params[:page]).per(2)
  end
end