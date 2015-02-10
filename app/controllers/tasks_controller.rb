class TasksController < ApplicationController
	before_action :find_project
	before_action :find_task, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user! 
	
	def index
		@entire_tasks = Task.all.order('title ASC')
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.new task_params
		@task.project = @project
		if @task.save
			redirect_to @project,  notice: "Task created successfully."
		else
			render :new, alert: "Task failed upon creation"  #layout:  new_task
		end
	end

	def show
		#find_task
	end

	def edit
		#find_task
	end

	def update
		#find_task
		if @task.update task_params
			redirect_to @task, notice: "Task updated successfully"
		else
			render :edit, alert: "Task failed to update"
		end
	end

	def destroy
		#find_task
		@task.destroy
			redirect_to project_tasks_path(@project), notice: "Task deleted successfully."
	end


	private
	def find_project
		@project = Project.find params[:project_id]
	end
	def find_task
		@task = Task.find params[:id]
	end
	def task_params
		#strong params check
		params.require(:task).permit(:title, :due_date, :body, :project_id)
	end
end