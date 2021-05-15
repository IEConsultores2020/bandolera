class AppliancesController < ApplicationController
  before_filter :authenticate_user! 
  load_and_authorize_resource
  before_action :set_appliance, only: [:show, :edit, :update, :destroy]  
  
  # GET /appliances
  # GET /appliances.json
  def index
    @appliances = Appliance.where(user_id: current_user.id)
  end

  # GET /appliances/1
  # GET /appliances/1.json
  def show
  end

  # GET /appliances/new
  def new
    @appliance = Appliance.new
  end
  
  def property_appliance
    @property = Property.find(params[:id])
    @appliance = Appliance.new
    #@appliance.property_id = @property.id
  end

  # GET /appliances/1/edit
  def edit
  end

  # POST /appliances
  # POST /appliances.json
  def create    
    @appliance = Appliance.new(appliance_params)
    @appliance.user_id = current_user.id
    @appliance.active = true
    @property = @appliance.property
    respond_to do |format|
      if @appliance.save
        format.html { redirect_to show_appliances_property_path(@property), notice: 'Appliance was successfully created.' }
        format.json { render :show, status: :created, location: @appliance }
      else
        format.html { render :new }
        format.json { render json: @appliance.errors, status: :unprocessable_entity }
      end
    end
  end
  
   
  
  # PATCH/PUT /appliances/1
  # PATCH/PUT /appliances/1.json
  def update   
    @appli = Appliance.find(params[:id])
    if  @appli.active.blank? and @appliance.active.present?
      @appliance.inactive_date = Time.now
    elsif @appliance.active.blank? and @appli.active.present? 
      @appliance.inactive_date = false
   end    
    @property = @appliance.property    
    respond_to do |format|
      if @appliance.update(appliance_params)
        format.html { redirect_to show_appliances_property_path(@property), notice: 'Appliance was successfully updated.' }
        format.json { render :show, status: :ok, location: @appliance }
      else
        format.html { render :edit }
        format.json { render json: @appliance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appliances/1
  # DELETE /appliances/1.json
  def destroy
    @property = @appliance.property
    @appliance.destroy
    respond_to do |format|
      format.html {redirect_to show_appliances_property_path(@property),notice: 'Appliance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appliance
      @appliance = Appliance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appliance_params
      params.require(:appliance).permit(:user_id,:purchase_price, :property_id, :gadget_id, :description_string,
        :acquisition_date, :warranty, :contact_number, :contact_email, :active, :invoice)
    end
end
