class CommentController < ApplicationController
	def create
		@article = Article.find(params[:article_id])
		if @article
			@comment = Comment.new(article: @article,
				user: current_user,
			 	msg: params[:comment][:msg])
			@comment.save
			redirect_to article_path(@article.id)
		else
			redirect_to article_index_path
		end
	end

	def delete
	end
end
