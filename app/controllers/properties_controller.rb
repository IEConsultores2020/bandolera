class PropertiesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  skip_authorize_resource :only => [:show_appliances, :new_appliance, 
    :show_repairs, :new_repair,:show_tenants, :new_tenant ]  
  skip_authorize_resource :post, :only => [:show_appliances, 
    :new_appliance, :show_repairs, :new_repair, :show_tenants, :new_tenant]
  
  def index
    @properties = Property.where(user_id: current_user.id)
  end
  def sum_purchase_appliances
    appliances=@properties.appliances
    appliances.each do|a|
      @purchase_price_total += a.purchase_price
    end
  end
  
  def show_repairs
    @property = Property.find(params[:id])
    @repairs = @property.repairs
  end  
  
  def new_repair
    @property = Property.find(params[:id])
    @repair = @property.repairs.build
  end  
  
  def show_appliances
    @property = Property.find(params[:id])
    #@appliance = @property.appliances
    @active_appliances = Property.find(params[:id]).appliances.where(active: true)
    @inactive_appliances = Property.find(params[:id]).appliances.where(active: false).order(inactive_date: :desc)
  end  
  
  def new_appliance
    @property = Property.find(params[:id])
    @appliance = @property.appliances.build
  end  
  
  def show_tenants
    @property = Property.find(params[:id])
    #@tenant = @property.tenants
    @active_tenants = Property.find(params[:id]).tenants.where(leasing: true)
    @inactive_tenants = Property.find(params[:id]).tenants.where(leasing: false).order(end_date: :desc)
  end  
  
  def new_tenant
    @property = Property.find(params[:id])
    @tenant = @property.tenants.build
  end  

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user_id = current_user.id
    if @property.save
      redirect_to properties_path, notice: "The property has been created."
    else
      render "new"
    end
  end
  
  # PATCH/PUT /props/1
  # PATCH/PUT /props/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_path, notice:  "The property has been deleted."
  end

private
  # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end
  def property_params
    params.require(:property).permit(:user_id, :profit, :unencumbered, :attachment,:landlord, :phone, :email, :address, :zipcode, :area, :hoa, :purchase_price, :purchase_date, :expenses, :net_income, :earning_capacity, :gross_income, :owner_ship_certificate, :home_owner_administrator_id)
  end
end
