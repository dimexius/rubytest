class TasksController < ApplicationController
 skip_before_filter :verify_authenticity_token  
	
	def index
	@tasks = Task.all	
	@task = Task.new
	end
	
	def create 
	  p params['task']
	  @task = Task.create(task_params)
	  redirect_to tasks_path
	end
	
	private 
	def task_params
	  params.require(:task).permit(:desc, :start_date, :end_date)	
	end
end
