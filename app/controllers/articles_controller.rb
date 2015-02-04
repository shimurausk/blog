class ArticlesController < ApplicationController

	before_action :get_category
	before_action :get_tags

	def get_category
		#@articles_hava_category = Blog.where("category not?",nil)
		#binding.pry
		@articles_hava_category = Article.where(status:'public')
		#binding.pry
		@articles_category = []
		@articles_hava_category.each do |c|
			@articles_category.push(c.category)
		end 
		#binding.pry
		@articles_category = @articles_category.uniq()
	end

	def get_tags
		@articles = Article.all
		@articles_tags = []

		@articles.each do |t|
			#binding.pry
			#raw d.tags.map(&:name).map { |t| link_to t, tag_path(d)}.join(', ')
			if t.status == 'public'
				if(t.tags.any?)
					t.tags.each do |hadTag|
						#binding.pry
						@articles_tags.push(hadTag.name)
					end
				end
			end
			#t.tags.any? ? @articles_tags.push(t.tags.map(&:name)) : ''
		end
		
		#binding.pry
		@articles_tags = @articles_tags.uniq()
	end

	def category
		@categorys = Article.where(category: params[:category])
	end

	def tag
		@tag = Tag.find_by_name(params[:tag]).articles
		#binding.pry
	end

	def related_post
		@article = Article.all
		
	end

	def new
		@article = Article.new
	end

	def create
		#render plain: params[:article].inspect
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
			else
			render 'new'
		end
		
	end

	def show
		@articles = Article.new
		@article = Article.find(params[:id])
		#binding.pry
		# if @article.status == 'draft'
		# 	redirect_to '/public/404.html'
		# end	
	end

	def index
		@articles = Article.all.order("id DESC")
		@tags = Tag.all
		#binding.pry
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
			else
			render 'edit'
		end
		
	end

	def destroy
		binding.pry
		@article = Article.find(params[:id])

		@article.destroy
		redirect_to articles_path		
	end

	private
		def article_params
			params.require(:article).permit(:title,:text,:status,:avatar,:tag_list,:category)
		end
end
