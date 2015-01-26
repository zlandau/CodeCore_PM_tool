class DiscussionsController < ApplicationController
	before_action :find_discussion

	def create
		@discussion = Discussion.new discussion_params
		if @discussion.save
			redirect_to project_discussions_path, notice: "Discussion created successfully"
		else
			redirect_to project_discussions_path, alert: "err: Discussion did not save!"
		end
	end
	def edit
	end
	def update
		if @discussion.update discussion_params
			redirect_to project_discussions_path, notice: "Discussion updated successfully"
		else
			redirect_to project_discussions_path, alert: "err: Discussion did not update!"
	end
	def destroy
		@discussion.destroy
		redirect_to project_discussions_path, notice: "Discussion deleted successfully"
	end
	private
	def find_discussion
		@discussion = Discussion.find(params[:id])
	end
	def discussion_params
		params.require(:discussion).permit(:title, :body)
	end
end
