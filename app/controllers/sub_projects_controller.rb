class SubProjectsController < ApplicationController
  before_filter :require_user
  before_action :set_project
  before_action :set_sub_project, only: [:show, :edit, :update, :destroy]

  # GET /sub_projects
  # GET /sub_projects.json
  def index
    @sub_projects = @project.sub_projects
  end

  # GET /sub_projects/1
  # GET /sub_projects/1.json
  def show
  end

  # GET /sub_projects/new
  def new
    @sub_project = SubProject.new
  end

  # GET /sub_projects/1/edit
  def edit
  end

  # POST /sub_projects
  # POST /sub_projects.json
  def create

    @sub_project = @project.sub_projects.build(sub_project_params)

    respond_to do |format|
      if @sub_project.save
        format.html { redirect_to project_sub_project_path(@project, @sub_project), notice: 'Sub project was successfully created.' }
        format.json { render :show, status: :created, location: @sub_project }
      else
        format.html { render :new }
        format.json { render json: @sub_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_projects/1
  # PATCH/PUT /sub_projects/1.json
  def update
    respond_to do |format|
      if @sub_project.update(sub_project_params)
        format.html { redirect_to project_sub_project_path(@project, @sub_project), notice: 'Sub project was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_project }
      else
        format.html { render :edit }
        format.json { render json: @sub_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_projects/1
  # DELETE /sub_projects/1.json
  def destroy
    @sub_project.destroy
    respond_to do |format|
      format.html { redirect_to project_path(@project), notice: 'Sub project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_project
      @sub_project = @project.sub_projects.find(params[:id])

    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_project_params
      params.require(:sub_project).permit(:name, attachments_attributes: [:attach_type, :attachment, :id, :_destroy])
    end
end
