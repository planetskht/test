class BenchMarksController < ApplicationController
  before_filter :require_user
  before_action :set_parents
  before_action :set_bench_mark, only: [:show, :edit, :update, :destroy]
  
  # GET /bench_marks
  # GET /bench_marks.json
  def index
    @bench_marks = @sub_project.bench_marks
  end

  # GET /bench_marks/1
  # GET /bench_marks/1.json
  def show
  end

  # GET /bench_marks/new
  def new
    @bench_mark = BenchMark.new
  end

  # GET /bench_marks/1/edit
  def edit
  end

  # POST /bench_marks
  # POST /bench_marks.json
  def create
    @bench_mark = @sub_project.bench_marks.build(bench_mark_params)

    respond_to do |format|
      if @bench_mark.save
        format.html { redirect_to project_sub_project_bench_marks_path(@project, @sub_project), notice: 'Bench mark was successfully created.' }
        format.json { render :show, status: :created, location: @bench_mark }
      else
        format.html { render :new }
        format.json { render json: @bench_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bench_marks/1
  # PATCH/PUT /bench_marks/1.json
  def update
    respond_to do |format|
      if @bench_mark.update(bench_mark_params)
        format.html { redirect_to project_sub_project_bench_marks_path(@project, @sub_project), notice: 'Bench mark was successfully updated.' }
        format.json { render :show, status: :ok, location: @bench_mark }
      else
        format.html { render :edit }
        format.json { render json: @bench_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bench_marks/1
  # DELETE /bench_marks/1.json
  def destroy
    @bench_mark.destroy
    respond_to do |format|
      format.html { redirect_to project_sub_project_bench_marks_path(@project, @sub_project), notice: 'Bench mark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bench_mark
      @bench_mark = @sub_project.bench_marks.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bench_mark_params
      params.require(:bench_mark).permit(:title, :description, :project_id, :type, attachments_attributes: [:attach_type, :attachment, :id, :_destroy])
    end
end
