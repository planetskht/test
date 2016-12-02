class HydralicParticularsController < ApplicationController
  before_action :set_parents
  before_action :set_hydralic_particular, only: [:show, :edit, :update, :destroy]
  

  # GET /hydralic_particulars
  # GET /hydralic_particulars.json
  def index
    @hydralic_particulars = @sub_project.hydralic_particulars
  end

  # GET /hydralic_particulars/1
  # GET /hydralic_particulars/1.json
  def show
  end

  # GET /hydralic_particulars/new
  def new
    @hydralic_particular = HydralicParticular.new
  end

  # GET /hydralic_particulars/1/edit
  def edit
  end

  # POST /hydralic_particulars
  # POST /hydralic_particulars.json
  def create
    @hydralic_particular = @sub_project.hydralic_particulars.build(hydralic_particular_params)

    respond_to do |format|
      if @hydralic_particular.save
        format.html { redirect_to project_sub_project_hydralic_particulars_path(@project, @sub_project), notice: 'Hydralic particular was successfully created.' }
        format.json { render :show, status: :created, location: @hydralic_particular }
      else
        format.html { render :new }
        format.json { render json: @hydralic_particular.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hydralic_particulars/1
  # PATCH/PUT /hydralic_particulars/1.json
  def update
    respond_to do |format|
      if @hydralic_particular.update(hydralic_particular_params)
        format.html { redirect_to project_sub_project_hydralic_particulars_path(@project, @sub_project), notice: 'Hydralic particular was successfully updated.' }
        format.json { render :show, status: :ok, location: @hydralic_particular }
      else
        format.html { render :edit }
        format.json { render json: @hydralic_particular.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hydralic_particulars/1
  # DELETE /hydralic_particulars/1.json
  def destroy
    @hydralic_particular.destroy
    respond_to do |format|
      format.html { redirect_to project_sub_project_hydralic_particulars_path(@project, @sub_project), notice: 'Hydralic particular was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hydralic_particular
      @hydralic_particular = @sub_project.hydralic_particulars.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hydralic_particular_params
      params.require(:hydralic_particular).permit(:from_km, :to_km, :title, :description, :project_id, :type, attachments_attributes: [:attach_type, :attachment, :id, :_destroy])
    end
end
