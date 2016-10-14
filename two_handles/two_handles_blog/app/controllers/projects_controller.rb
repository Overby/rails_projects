class ProjectsController < ApplicationController
  def index
    @projects = Project.all.order("created_at desc")
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params

    if @project.save
      redirect_to @project, notice: "Nice job! Now it's saved."
    else
      render 'new'
    end
  end

  private

  def project_params
    parms.require(:project).permit(:title, :description,
    :link)
  end


end
