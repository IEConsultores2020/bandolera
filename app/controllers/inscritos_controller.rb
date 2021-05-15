class InscritosController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /inscritos
  # GET /inscritos.json
  def index
    @inscritos = Inscrito.all
  end

  # GET /inscritos/1
  # GET /inscritos/1.json
  def show
  end

  # GET /inscritos/new
  def new
    
  end

  # GET /inscritos/1/edit
  def edit
  end

  # POST /inscritos
  # POST /inscritos.json
  def create
    
    respond_to do |format|
      if @inscrito.save
        format.html { redirect_to @inscrito, notice: 'Inscrito was successfully created.' }
        format.json { render :show, status: :created, location: @inscrito }
      else
        format.html { render :new }
        format.json { render json: @inscrito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inscritos/1
  # PATCH/PUT /inscritos/1.json
  def update
    respond_to do |format|
      if @inscrito.update(inscrito_params)
        format.html { redirect_to @inscrito, notice: 'Inscrito was successfully updated.' }
        format.json { render :show, status: :ok, location: @inscrito }
      else
        format.html { render :edit }
        format.json { render json: @inscrito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inscritos/1
  # DELETE /inscritos/1.json
  def destroy
    @inscrito.destroy
    respond_to do |format|
      format.html { redirect_to inscritos_url, notice: 'Inscrito was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inscrito
      @inscrito = Inscrito.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inscrito_params
      params.require(:inscrito).permit(:user_id, :empresa_id, :activo)
    end
end
