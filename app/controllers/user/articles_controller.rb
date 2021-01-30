class User::ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        response = Faraday.get(params[:url])
        og = OGP::OpenGraph.new(response.body)
        og_title = og&.title
        og_image = og&.image.url
        og_description = og&.description
        @article = current_user.articles.build(url: params[:url], og_title: og_title, og_image: og_image, og_description: og_description)
        if @article.save
          flash[:notice] = "投稿しました"
          redirect_to root_path
        else
          flash[:alert] = "URLを変更してください"
          render :new
        end
      end
    rescue => error
      @article = current_user.articles.build(url: params[:url])
      if @article.save
        flash[:notice] = "投稿しました"
        redirect_to root_path
      else
        flash[:alert] = "URLを変更してください"
        render :new
      end
    end
  end
end