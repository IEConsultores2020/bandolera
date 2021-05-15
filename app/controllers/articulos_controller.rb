class ArticulosController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource


  # GET /articulos
  # GET /articulos.json
  def index   
    if current_user.name ==  "GerenteNanducho" then
        if params[:search]
           @articulos = Articulo.search(params[:search]).order("nombre ASC")
        else
          if params[:search_componente]
            @articulos = Articulo.filter(params[:search_componente]).order("nombre ASC")
          else
           @articulos = Articulo.order("nombre DESC")
          end 
        end
    else
        if params[:search]
           @articulos = Articulo.search(params[:search]).order("nombre ASC")
        else
          if params[:search_componente]
            @articulos = Articulo.filter(params[:search_componente]).order("nombre ASC")
          else
           @articulos = Articulo.where("user_id == :user_id", user_id: current_user.id).order("nombre DESC")
          end 
        end      
    end
  end


  # GET /articulos/1
  # GET /articulos/1.json
  def show
    
  end

  # GET /articulos/new
  def new
    
  end

  # GET /articulos/1/edit
  def edit
  end




  # POST /articulos
  # POST /articulos.json
  def create
    
    
    @articulo.user_id = current_user.id
    respond_to do |format|
      if @articulo.save
        format.html { redirect_to @articulo, notice: 'Articulo was successfully created.' }
        format.json { render :show, status: :created, location: @articulo }
      else
        format.html { render :new }
        format.json { render json: @articulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articulos/1
  # PATCH/PUT /articulos/1.json
  def update
    respond_to do |format|
      if @articulo.update(articulo_params)
        format.html { redirect_to @articulo, notice: 'Articulo was successfully updated.' }
        format.json { render :show, status: :ok, location: @articulo }
      else
        format.html { render :edit }
        format.json { render json: @articulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articulos/1
  # DELETE /articulos/1.json
  def destroy
    @articulo.destroy
    respond_to do |format|
      format.html { redirect_to articulos_url, notice: 'Articulo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_articulo

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def articulo_params
      params.require(:articulo).permit(:nombre, :descripcion, :foto, :barcode, :unidad_medida_id, :componente_id, :modelo_id, :user_id)
    end

end
