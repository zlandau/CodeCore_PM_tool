class DiscussionsController < ApplicationController
	before_action :find_project
	before_action :find_discussion, only: [:update, :destroy]
	before_action :authenticate_user! 

	def create
		@discussion = Discussion.new discussion_params
		@discussion.project = @project
		respond_to do |format|
			if @discussion.save
				format.html { redirect_to project_path(@project), notice: "Discussion created successfully."}
				format.js { render } #render /discussions/create.js.erb success case
			else
				format.html { redirect_to project_path(@project), alert: "err: Discussion did not save!" }
				format.js { render }
			end
		end
	end

	def update
		respond_to do | format |
			if @discussion.update discussion_params
				format.html { redirect_to project_path(@project), notice: "Discussion updated successfully."}
				format.js { render "/discussions/create.js.erb"}
			else
				format.hml { redirect_to project_path(@project), notice: "Discussion failed to update"}
				format.js { render "/discussions/create.js.erb"}
			end
		end
	end

	def destroy
		@discussion.destroy
		respond_to do | format |
			format.html { redirect_to project_path(@project), notice: "Discussion deleted successfully" }
			format.js { render }  #render "/discussion/destroy.js.erb"
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