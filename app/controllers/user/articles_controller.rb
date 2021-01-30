class User::ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:notice] = "投稿しました"
      redirect_to root_path
    else
      flash[:alert] = "無効なリクエストが送信されました。"
      render :new
    end
  end

  private
    def article_params
      params.permit(:url)
    end
end