class ArticlesController < ApplicationController

	include ApplicationHelper

	before_action :get_category
	before_action :get_tags
	before_action :search_form

	def get_category
		@articles_have_category = Article.where(status:'public')
		@articles_category = []
		@articles_have_category.each do |c|
		  @articles_category.push(c.category_name)
		end
		@articles_category = @articles_category.uniq()
	end

	def get_tags
		@articles = Article.all
		@articles_tags = []

		@articles.each do |t|
			#raw d.tags.map(&:name).map { |t| link_to t, tag_path(d)}.join(', ')
			if t.status == 'public'
				if(t.tags.any?)
					t.tags.each do |hadTag|
						@articles_tags.push(hadTag.name)
					end
				end
			end
			#t.tags.any? ? @articles_tags.push(t.tags.map(&:name)) : ''
		end
		@articles_tags = @articles_tags.uniq()
	end

	def search_form
		@q = Article.search(params[:q])
		@search = @q.result().reverse()
	end

	def category
		@articles = []
		Article.all.each do |article|
			if article.category_name == params[:category]
			  @articles.push(article)
		  end
		end
		pagenation
	end

	def tag
		@articles = Tag.find_by_name(params[:tag]).articles
		pagenation
	end

	def search
		@articles = Article.search(params[:q]).result().reverse()
		pagenation
	end

	def pagenation
		@items = Kaminari.paginate_array(@articles).page(params[:page]).per(5)
	end

	def related_post
		@article = Article.all
	end

	def new
		@article = Article.new
		all_category
		all_tag
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to @article
			else
				all_category
				all_tag
				render 'new'
		end

	end

	def show
		@articles = Article.find(params[:id])
	end

	def index
		@items = Article.all.order("id DESC").page(params[:page])
		@article = Article.new
		@tags = Tag.all
	end

	def edit
		@article = Article.find(params[:id])
		all_category
		all_tag
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			ArticleCategory.update(params[:id], :category_id => article_params[:category_id])
			redirect_to @article
			else
			all_category
			all_tag
			render 'edit'
		end

	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	private
		def article_params
			params.require(:article).permit(:title,:text,:status,:avatar,:tag_list,:category_id,:category_name)
		end
end
