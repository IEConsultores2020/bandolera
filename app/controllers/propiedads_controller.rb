class PropiedadsController < ApplicationController
   def index
    @propiedades = Propiedad.all
  end

  def new
    @propiedad = Propiedad.new
  end

  def create
    @propiedad = Propiedad.new(propiedad_params)

    if @propiedad.save
      redirect_to propiedads_path, notice: "El archivo #{@propiedad.nombre} ha sido guardado."
    else
      render "new"
    end
  end

  def destroy
    @propiedad = Propiedad.find(params[:id])
    @propiedad.destroy
    redirect_to propiedads_path, notice:  "El archivo #{@propiedad.nombre} ha sido eliminado."
  end

private
  def propiedad_params
    params.require(:propiedad).permit(:nombre, :archivo)
  end

end
