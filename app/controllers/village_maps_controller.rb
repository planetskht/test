class VillageMapsController < ApplicationController
  before_filter :require_user
  before_action :set_parents
  before_action :set_village_map, only: [:show, :edit, :update, :destroy]
  
  # GET /village_maps
  # GET /village_maps.json
  def index
    if params[:map_type].present? && params[:map_type] == "Site Map"
      @village_maps = @sub_project.village_maps.site_maps
    else
      @village_maps = @sub_project.village_maps.normal_maps
    end
  end

  # GET /village_maps/1
  # GET /village_maps/1.json
  def show
  end

  # GET /village_maps/new
  def new
    @village_map = VillageMap.new(:map_type => params[:map_type])
  end

  # GET /village_maps/1/edit
  def edit
  end

  # POST /village_maps
  # POST /village_maps.json
  def create
    @village_map = @sub_project.village_maps.build(village_map_params)

    respond_to do |format|
      if @village_map.save
        format.html { redirect_to  project_sub_project_village_maps_path(@project, @sub_project, :map_type => @village_map.map_type), notice: 'Village map was successfully created.' }
        format.json { render :show, status: :created, location: @village_map }
      else
        format.html { render :new }
        format.json { render json: @village_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /village_maps/1
  # PATCH/PUT /village_maps/1.json
  def update
    respond_to do |format|
      if @village_map.update(village_map_params)
        format.html { redirect_to project_sub_project_village_maps_path(@project, @sub_project, :map_type => @village_map.map_type), notice: 'Village map was successfully updated.' }
        format.json { render :show, status: :ok, location: @village_map }
      else
        format.html { render :edit }
        format.json { render json: @village_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /village_maps/1
  # DELETE /village_maps/1.json
  def destroy
    map_type = @village_map.map_type
    @village_map.destroy
    respond_to do |format|
      format.html { redirect_to project_sub_project_village_maps_path(@project, @sub_project, :map_type => map_type), notice: 'Village map was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_village_map
      @village_map = @sub_project.village_maps.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def village_map_params
      params.require(:village_map).permit(:title, :village_name, :map_type, :project_id, attachments_attributes: [:attach_type, :attachment, :id, :_destroy])
    end
end
