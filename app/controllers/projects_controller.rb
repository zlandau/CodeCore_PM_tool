class ProjectsController < ApplicationController
	before_action :find_project, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user! 	

	def index
		if params[:q] # if search string
			@entire_projects = Project.where("title LIKE ? OR description LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
#			raise params.inspect
		else
			@entire_projects = Project.all.order('title ASC')
		end
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new project_params
		if @project.save
			redirect_to project_path(@project), notice: "Project created successfully"
		else
			render :new, alert: "Project failed upon creation."
		end
	end

	def edit
		#find_project
	end

	def update
		#find_project
		if @project.update project_params
			redirect_to project_path(@project), notice: "Project updated successfully"
		else
			render :edit, alert: "Project failed to update."
		end
	end

	def show
		#find_project
		@discussion = Discussion.new
	end

	def destroy
		#find_project
		@project.destroy
		redirect_to projects_path, notice: "Project deleted successfully"
	end


	private

	def find_project
		@project = Project.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:title, :description, :due_date)
	end

end