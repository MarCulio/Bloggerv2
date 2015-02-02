class ArticlesController < ApplicationController
	include ArticlesHelper
	impressionist actions: [:show], unique: [:session_hash]
	
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id
		impressionist(@article)
	end
	def new
		@article = Article.new
		@comment = Comment.new
		@comment.article_id = @article.id
	end

	def create
		@article = Article.new(article_params)
  		@article.save
  		flash.notice = "Article '#{@article.title}' was created"
		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash.notice = "Article '#{@article.title}' was deleted"
		redirect_to action: "index"
	end

	def edit
		@article = Article.find(params[:id])

	end

	def update
		@article = Article.find(params[:id])
  		@article.update(article_params)
  		if @article.valid?
	  		flash.notice = "Article '#{@article.title}' Updated!"
	  	else
	  		flash.notice = "Article is not valid!"
	  	end
  		redirect_to article_path(@article)
	end
end
