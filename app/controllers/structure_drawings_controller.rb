class StructureDrawingsController < ApplicationController
  before_filter :require_user
  before_action :set_parents
  before_action :set_structure_drawing, only: [:show, :edit, :update, :destroy]

  # GET /structure_drawings
  # GET /structure_drawings.json
  def index
    @structure_drawings = @sub_project.structure_drawings
  end

  # GET /structure_drawings/1
  # GET /structure_drawings/1.json
  def show
  end

  # GET /structure_drawings/new
  def new
    @structure_drawing = StructureDrawing.new
  end

  # GET /structure_drawings/1/edit
  def edit
  end

  # POST /structure_drawings
  # POST /structure_drawings.json
  def create
    @structure_drawing = @sub_project.structure_drawings.build(structure_drawing_params)

    respond_to do |format|
      if @structure_drawing.save
        format.html { redirect_to project_sub_project_structure_drawings_path(@project, @sub_project), notice: 'Structure drawing was successfully created.' }
        format.json { render :show, status: :created, location: @structure_drawing }
      else
        format.html { render :new }
        format.json { render json: @structure_drawing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /structure_drawings/1
  # PATCH/PUT /structure_drawings/1.json
  def update
    respond_to do |format|
      if @structure_drawing.update(structure_drawing_params)
        format.html { redirect_to project_sub_project_structure_drawings_path(@project, @sub_project), notice: 'Structure drawing was successfully updated.' }
        format.json { render :show, status: :ok, location: @structure_drawing }
      else
        format.html { render :edit }
        format.json { render json: @structure_drawing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /structure_drawings/1
  # DELETE /structure_drawings/1.json
  def destroy
    @structure_drawing.destroy
    respond_to do |format|
      format.html { redirect_to project_sub_project_structure_drawings_path(@project, @sub_project), notice: 'Structure drawing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_structure_drawing
      @structure_drawing = @sub_project.structure_drawings.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def structure_drawing_params
      params.require(:structure_drawing).permit(:title, :description, :structure_type, attachments_attributes: [:attach_type, :attachment, :id, :_destroy])
    end

    def set_parents
      @project = Project.find(params[:project_id])
      @sub_project = @project.sub_projects.find(params[:sub_project_id])
    end
end
