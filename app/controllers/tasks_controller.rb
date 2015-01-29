class TasksController < ApplicationController
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
		if @task.save
			redirect_to @task, notice: "Task created successfully."
		else
			render :new  #layout:  new_task
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
			render :edit
		end
	end

	def destroy
		#find_task
		@task.destroy
			redirect_to tasks_path, notice: "Task deleted successfully."
	end

	private

	def find_task
		@task = Task.find params[:id]
	end

	def task_params
		#strong params check
		params.require(:task).permit(:title, :due_date, :project_id)
	end
end
