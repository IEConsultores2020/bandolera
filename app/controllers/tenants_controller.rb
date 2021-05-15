class TenantsController < ApplicationController
  before_action :set_tenant, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  load_and_authorize_resource
  skip_authorize_resource :only => [:show_payments, :new_payment ]  
  skip_authorize_resource :post, :only => [:show_payments, :new_payment ]
  
  def show_payments
    @tenant = Tenant.find(params[:id])
    @property = @tenant.property
    #@appliance = @property.appliances
    @payments = Tenant.find(params[:id]).payments.where(applied: false)
    @applied_payments = Tenant.find(params[:id]).payments.where(applied: true).order(paid_period: :desc)
  end  
  
  def new_payment
    @tenant = Tenant.find(params[:id])
    @property = @tenant.property
    @payment = @tenant.payments.build
  end  
  
  # GET /tenants
  # GET /tenants.json
  def index
    @tenants = Tenant.where(user_id: current_user.id)
  end

  # GET /tenants/1
  # GET /tenants/1.json
  def show
  end

  # GET /tenants/new
  def new
    @tenant = Tenant.new
  end

  # GET /tenants/1/edit
  def edit
  end

  # POST /tenants
  # POST /tenants.json
  def create
    @tenant = Tenant.new(tenant_params)
    @property = @tenant.property
    @tenant.user_id = current_user.id
    @tenant.leasing = true

    respond_to do |format|
      if @tenant.save
        format.html { redirect_to show_tenants_property_path(@property), notice: 'Tenant was successfully created.' }
        format.json { render :show, status: :created, location: @tenant }
      else
        format.html { render :new }
        format.json { render json: @tenant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tenants/1
  # PATCH/PUT /tenants/1.json
  def update
    @property = @tenant.property
    respond_to do |format|
      if @tenant.update(tenant_params)
        format.html { redirect_to show_tenants_property_path(@property), notice: 'Tenant was successfully updated.' }
        format.json { render :show, status: :ok, location: @tenant }
      else
        format.html { render :edit }
        format.json { render json: @tenant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tenants/1
  # DELETE /tenants/1.json
  def destroy
    @property = @tenant.property
    @tenant.destroy
    respond_to do |format|
      format.html { redirect_to show_tenants_property_path(@property), notice: 'Tenant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant
      @tenant = Tenant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tenant_params
      params.require(:tenant).permit(:property_id, :monthly_rent, :monthly_administration, :begin_date, :end_date, :name, :phone, :email, :leasing, :user_id, :leasing_contract)
    end
end
