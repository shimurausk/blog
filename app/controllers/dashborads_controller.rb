class DashboradsController < ApplicationController
	def index
		@articles = Article.all
		# @article = Article.find(params[:article_id])
	end

	def show
		@articles = Article.all
		# @article = Article.find(params[:article_id])
	end
end
