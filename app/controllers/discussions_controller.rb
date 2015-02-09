class DiscussionsController < ApplicationController
	before_action :find_project
	before_action :find_discussion, only: [ :destroy]
	before_action :authenticate_user! 

	def create
		@discussion = Discussion.new discussion_params
		@discussion.project = @project
		respond_to do |format|
			if @discussion.save
				format.html { redirect_to @project, notice: "Discussion created successfully."}
				format.js { render } #render /discussions/create.js.erb success case
			else
				format.html { redirect_to project_path(@project), alert: "err: Discussion did not save!" }
				format.js { render }
			end
		end
	end

	def destroy
		@discussion.destroy
		respond_to do | format |
			format.html { redirect_to project_path(@project), notice: "Discussion deleted successfully" }
			format.js { render }  #this is to render "/discussion/destroy.js.erb"
		end
	end


	private
	def find_project
		@project = Project.find params[:project_id]
	end
	def find_discussion
		@discussion = Discussion.find(params[:id])
	end
	def discussion_params
		params.require(:discussion).permit(:title, :description)
	end
end