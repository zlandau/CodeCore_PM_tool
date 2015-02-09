class CommentsController < ApplicationController
	before_action :find_discussion
	before_action :find_comment, only: [ :destroy]
	before_action :authenticate_user! 

	def create
		@comment = Comment.new comment_params
		@comment.discussion = @discussion

		if @comment.save
			redirect_to project_path(@discussion.project), notice: "Comment created successfully"
		else
			redirect_to project_path(@discussion.project), alert: "err: Comment didn't save!"
		end
	end

	def destroy
		@comment.destroy
		respond_to do |format|
			format.js { render } #render "/comments/destroy.js.erb"
			format.html { redirect_to project_path(@discussion.project), notice: "Comment deleted successfully" }
			#redirect_to project_path(@discussion.project), notice: "Comment deleted successfully"

		end

	end


	private
	def find_discussion
		@discussion = Discussion.find params[:discussion_id]
	end
	def find_comment
		@comment = Comment.find(params[:id])
	end
	def comment_params
		params.require(:comment).permit(:body)
	end
end