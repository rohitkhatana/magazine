class ArticleController < ApplicationController
	def index
		@articles = Article.all
	end

	def new 
		@article = Article.new
	end

	def create
		@article = Article.new(article_param)
		@article.author = current_user

		if @article.save!
			redirect_to article_index_path 
		else 
			redirect_to new_article_path
		end
	end

	def show
		@article = Article.find(params[:id])
		@comments = Comment.where(article: @article, comment_id: nil)
	end

	private 
		def article_param
			params.require(:article).permit(:title, :body)
		end

end
