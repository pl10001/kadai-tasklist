class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "Taskを登録しました。"
      redirect_to @task
    else
      flash.now[:danger] = "Taskが登録出来ませんでした。"
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "Taskを編集しました。"
      redirect_to @task
    else
      flash.now[:danger] = "Taskが編集出来ませんでした。"
      render :edit
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "Taskを削除しました。"
    redirect_to root_path
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
end
