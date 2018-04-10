class CommentsController < ApplicationController
	before_action :find_article
	before_action :authenticate, except: ['create']

	def create
		@comment = @article.comments.create(comment_params)
		redirect_to article_path(@article)
	end

	def destroy
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	private def find_article
		@article = Article.find(params[:article_id])
	end

	private def comment_params
		params.require(:comment).permit(:commenter, :body)
	end

	private def authenticate
		if !logged_in?
			redirect_to login_path
		end
	end
end
