class TodosController < ApplicationController
  def index
    @todo = Todo.new
    if user_signed_in?
      @todos = Todo.incomplete
    else 
      @todos = []
    end
  end

  def show
      @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def create
    @todo = Todo.new(params[:todo])
    if @todo.save
      render :partial=>"todo", :object => @todo
    else
      render 'new'
    end
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(params[:todo])
      redirect_to todo_path(@todo.id)
    else
      render 'edit'
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end
end
