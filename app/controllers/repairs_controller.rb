class RepairsController < ApplicationController
  before_action :set_repair, only: [:show, :edit, :update, :destroy]

  # GET /repairs
  # GET /repairs.json
  def index
    @repairs = Repair.where(user_id: current_user.id)
  end

  # GET /repairs/1
  # GET /repairs/1.json
  def show
  end

  # GET /repairs/new
  def new
    @repair = Repair.new
  end

  # GET /repairs/1/edit
  def edit
  end

  # POST /repairs
  # POST /repairs.json
  def create
    @repair = Repair.new(repair_params)
    @repair.user_id = current_user.id
    @property = @repair.property

    respond_to do |format|
      if @repair.save
        format.html { redirect_to show_repairs_property_path(@property), notice: 'Repair was successfully created.' }
        format.json { render :show, status: :created, location: @repair }
      else
        format.html { render :new }
        format.json { render json: @repair.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repairs/1
  # PATCH/PUT /repairs/1.json
  def update
    respond_to do |format|
      if @repair.update(repair_params)
        format.html { redirect_to @repair, notice: 'Repair was successfully updated.' }
        format.json { render :show, status: :ok, location: @repair }
      else
        format.html { render :edit }
        format.json { render json: @repair.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repairs/1
  # DELETE /repairs/1.json
  def destroy
    @property = @repair.property
    @repair.destroy
    respond_to do |format|
      format.html {redirect_to show_repairs_property_path(@property), notice: 'Repair was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repair
      @repair = Repair.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repair_params
      params.require(:repair).permit(:purchase_order, :contractors, :type_repair_id, 
        :details,  :email, :phone, :cost, :warranty, :date_repair, :user_id, :property_id)
    end
end
