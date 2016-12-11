class CustomMenusController < ApplicationController
  before_filter :require_user
  before_action :set_parents
  before_action :set_custom_menu, only: [:show, :edit, :update, :destroy]

  # GET /custom_menus
  # GET /custom_menus.json
  def index
    @custom_menus = @sub_project.custom_menus.all
  end

  # GET /custom_menus/1
  # GET /custom_menus/1.json
  def show
  end

  # GET /custom_menus/new
  def new
    @custom_menu = @sub_project.custom_menus.new
    @custom_menu.attachments  << Attachment.new
  end

  # GET /custom_menus/1/edit
  def edit
    @custom_menu.attachments  << Attachment.new if @custom_menu.attachments.blank?
  end

  # POST /custom_menus
  # POST /custom_menus.json
  def create
    @custom_menu = @sub_project.custom_menus.build(custom_menu_params)

    respond_to do |format|
      if @custom_menu.save
        format.html { redirect_to project_sub_project_custom_menus_path(@project, @sub_project), notice: 'Custom menu was successfully created.' }
        format.json { render :show, status: :created, location: @custom_menu }
      else
        format.html { render :new }
        format.json { render json: @custom_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custom_menus/1
  # PATCH/PUT /custom_menus/1.json
  def update
    respond_to do |format|
      if @custom_menu.update(custom_menu_params)
        format.html { redirect_to project_sub_project_custom_menus_path(@project, @sub_project), notice: 'Custom menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @custom_menu }
      else
        format.html { render :edit }
        format.json { render json: @custom_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_menus/1
  # DELETE /custom_menus/1.json
  def destroy
    @custom_menu.destroy
    respond_to do |format|
      format.html { redirect_to project_sub_project_custom_menus_path(@project, @sub_project), notice: 'Custom menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_menu
      @custom_menu = @sub_project.custom_menus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custom_menu_params
      params.require(:custom_menu).permit(:menu_name, :sub_menu_name, :attachment_type, attachments_attributes: [:attach_type, :attachment, :id, :_destroy])
    end
end
