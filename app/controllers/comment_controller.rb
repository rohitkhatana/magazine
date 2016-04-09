class CommentController < ApplicationController
	def create
		@article = Article.find(params[:article_id])
		if @article
			if valid_comment?
				@comment = Comment.new(article: @article,
					user: current_user,
			 		msg: params[:comment][:msg], comment_id: comment_id)
				@comment.save
				redirect_to article_path(@article.id)
			end
		else
			redirect_to article_index_path
		end
	end

	def destroy
		@comment = Comment.where(id: params[:id], article_id: params[:article_id]).first
		if @comment.delete_allowed?(current_user)
			@comment.delete
		end
		redirect_to article_path(params[:article_id])
	end

	private 
		def valid_comment?
			if comment_id
				return Comment.where(id: comment_id).present?
			end
			true
		end

		def article_id
			params[:article_id]
		end

		def comment_id
			params[:comment][:id]
		end
end
