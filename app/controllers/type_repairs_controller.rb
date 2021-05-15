class TypeRepairsController < ApplicationController
  before_action :set_type_repair, only: [:show, :edit, :update, :destroy]

  # GET /type_repairs
  # GET /type_repairs.json
  def index
    @type_repairs = TypeRepair.all
  end

  # GET /type_repairs/1
  # GET /type_repairs/1.json
  def show
  end

  # GET /type_repairs/new
  def new
    @type_repair = TypeRepair.new
  end

  # GET /type_repairs/1/edit
  def edit
  end

  # POST /type_repairs
  # POST /type_repairs.json
  def create
    @type_repair = TypeRepair.new(type_repair_params)

    respond_to do |format|
      if @type_repair.save
        format.html { redirect_to @type_repair, notice: 'Type repair was successfully created.' }
        format.json { render :show, status: :created, location: @type_repair }
      else
        format.html { render :new }
        format.json { render json: @type_repair.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_repairs/1
  # PATCH/PUT /type_repairs/1.json
  def update
    respond_to do |format|
      if @type_repair.update(type_repair_params)
        format.html { redirect_to @type_repair, notice: 'Type repair was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_repair }
      else
        format.html { render :edit }
        format.json { render json: @type_repair.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_repairs/1
  # DELETE /type_repairs/1.json
  def destroy
    @type_repair.destroy
    respond_to do |format|
      format.html { redirect_to type_repairs_url, notice: 'Type repair was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_repair
      @type_repair = TypeRepair.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_repair_params
      params.require(:type_repair).permit(:name, :description)
    end
end
