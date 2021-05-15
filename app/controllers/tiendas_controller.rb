class TiendasController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /tiendas
  # GET /tiendas.json
  def index
   
    if current_user.name ==  "GerenteNanducho" 
      @tiendas = Tienda.all.order("nombre DESC")
    elsif current_user.seller?
      @tiendas = Tienda.where("email == :email", email: current_user.email)
    end
  end

  # GET /tiendas/1
  # GET /tiendas/1.json
  def show
  end

  # GET /tiendas/new
  def new
  end

  # GET /tiendas/1/edit
  def edit
  end

  # POST /tiendas
  # POST /tiendas.json
  def create
    @tienda.user_id = current_user.id
    respond_to do |format|
      if @tienda.save
        format.html { redirect_to @tienda, notice: 'Tienda was successfully created.' }
        format.json { render :show, status: :created, location: @tienda }
      else
        format.html { render :new }
        format.json { render json: @tienda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tiendas/1
  # PATCH/PUT /tiendas/1.json
  def update
    respond_to do |format|
      if @tienda.update(tienda_params)
        format.html { redirect_to @tienda, notice: 'Tienda was successfully updated.' }
        format.json { render :show, status: :ok, location: @tienda }
      else
        format.html { render :edit }
        format.json { render json: @tienda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tiendas/1
  # DELETE /tiendas/1.json
  def destroy
    @tienda.destroy
    respond_to do |format|
      format.html { redirect_to tiendas_url, notice: 'Tienda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tienda
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tienda_params
      params.require(:tienda).permit(:nombre, :descripcion, :empresa_id, :user_id)
    end
end
