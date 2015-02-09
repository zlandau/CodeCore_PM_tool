class CommentsController < ApplicationController
	before_action :find_project
	before_action :find_comment, only [ :destroy]
	before_action :authenticate_user! 

	def create
		@comment = Comment.new comment_params
		@comment.project = @project
		if @comment.save
			redirect_to discussion_comments_path, notice: "Comment created successfully"
		else
			redirect_to discussion_comments_path, alert: "err: Comment didn't save!"
		end
	end

	def destroy
		@comment.destroy
		redirect_to discussion_comments_path, notice: "Comment deleted successfully"
	end


	private
	def find_project
		@project = Project.find params[:project_id]
	end
	def find_comment
		@comment = Comment.find(params[:id])
	end
	def comment_params
		params.require(:comment).permit(:body)
	end
end