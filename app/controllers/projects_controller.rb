class ProjectsController < ApplicationController
	before_action :find_project, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user! 	

	def index
		@entire_projects = Project.all.order('title ASC')
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new project_params
		if @project.save
			redirect_to project_path(@project), notice: "Project created successfully"
		else
			render :new
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
			render :edit
		end
	end

	def show
		#find_project
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
