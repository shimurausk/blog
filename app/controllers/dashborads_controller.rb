class DashboradsController < ApplicationController
	before_action :authenticate_user!
	def index
		@articles = Article.all.sort().reverse()
	end

	def show
		@articles = Article.all.sort().reverse()
	end
end
