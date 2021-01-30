class User::ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    response = Faraday.get(params[:url])
    og = OGP::OpenGraph.new(response.body)
    og_title = og.title
    og_image = og.image.url
    og_description = og.description
    og_url = og.url

    @article = current_user.articles.build(url: params[:url], og_title: og_title, og_image: og_image, og_description: og_description, og_url: og_url)
    if @article.save  
      flash[:notice] = "投稿しました"
      redirect_to root_path
    else
      flash[:alert] = "無効なリクエストが送信されました。"
      render :new
    end
  end
end