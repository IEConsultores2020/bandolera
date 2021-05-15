class HomeOwnerAdministratorsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  before_action :set_home_owner_administrator, only: [:show, :edit, :update, :destroy]

  # GET /home_owner_administrators
  # GET /home_owner_administrators.json
  def index
    @home_owner_administrators = HomeOwnerAdministrator.all
  end

  # GET /home_owner_administrators/1
  # GET /home_owner_administrators/1.json
  def show
  end

  # GET /home_owner_administrators/new
  def new
    @home_owner_administrator = HomeOwnerAdministrator.new
  end

  # GET /home_owner_administrators/1/edit
  def edit
  end

  # POST /home_owner_administrators
  # POST /home_owner_administrators.json
  def create
    @home_owner_administrator = HomeOwnerAdministrator.new(home_owner_administrator_params)

    respond_to do |format|
      if @home_owner_administrator.save
        format.html { redirect_to @home_owner_administrator, notice: 'Home owner administrator was successfully created.' }
        format.json { render :show, status: :created, location: @home_owner_administrator }
      else
        format.html { render :new }
        format.json { render json: @home_owner_administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /home_owner_administrators/1
  # PATCH/PUT /home_owner_administrators/1.json
  def update
    respond_to do |format|
      if @home_owner_administrator.update(home_owner_administrator_params)
        format.html { redirect_to @home_owner_administrator, notice: 'Home owner administrator was successfully updated.' }
        format.json { render :show, status: :ok, location: @home_owner_administrator }
      else
        format.html { render :edit }
        format.json { render json: @home_owner_administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /home_owner_administrators/1
  # DELETE /home_owner_administrators/1.json
  def destroy
    @home_owner_administrator.destroy
    respond_to do |format|
      format.html { redirect_to home_owner_administrators_url, notice: 'Home owner administrator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home_owner_administrator
      @home_owner_administrator = HomeOwnerAdministrator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_owner_administrator_params
      params.require(:home_owner_administrator).permit(:name, :email, :mobile)
    end
end
