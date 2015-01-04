class DashboradsController < ApplicationController
	before_action :authenticate_user!
	def index
		@articles = Article.all
		# @article = Article.find(params[:article_id])
	end

	def show
		@articles = Article.all
		# @article = Article.find(params[:article_id])
	end
end
