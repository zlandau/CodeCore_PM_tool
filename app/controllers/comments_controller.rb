class CommentsController < ApplicationController
	before_action :find_comment, only [:update, :destroy]
	before_action :authenticate_user! 

	def create
		@comment = Comment.new comment_params
		if @comment.save
			redirect_to discussion_comments_path, notice: "Comment created successfully"
		else
			redirect_to discussion_comments_path, alert: "err: Comment didn't save!"
		end
	end

	def update
		if @comment.update comment_params
			redirect_to discussion_comments_path, notice: "Comment updated successfully"
		else
			redirect_to discussion_comments_path, alert: "err: Comment didn't update!"
		end
	end

	def destroy
		@comment.destroy
		redirect_to discussion_comments_path, notice: "Comment deleted successfully"
	end


	private
	def find_comment
		@comment = Comment.find(params[:id])
	end
	def comment_params
		params.require(:comment).permit(:body)
	end
end