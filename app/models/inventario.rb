class Inventario < ActiveRecord::Base
  belongs_to :tienda
  belongs_to :articulo 
  belongs_to :user
  
  def tienda_nombre
     tienda.try(:nombre)
  end 

  def tienda_nombre=(nombre)
    self.tienda = tienda.find_or_create_by_nombre(nombre) if nombre.present?
  end

  def articulo_nombre
     articulo.try(:nombre)
  end 

  def articulo_nombre=(nombre)
    self.articulo = Articulo.find_by_nombre(nombre)  if nombre.present?
  end  

  def articulo_descripcion=(nombre)
    self.articulo = Articulo.find_by_descripcion(nombre)  if nombre.present?
  end  

  def moneda
  	 'COP'
  end
  
  def valor_total
    cantidad_integer.to_f.round(2) * valor_unidad
   end 

  def self.search(query, filter, datefilter)
    if datefilter.blank? or datefilter == 0 then
    # where(:title, query) -> This would return an exact match of the query
      joins(:articulo).where("nombre like ? and exists (select 1 from componentes where codigo like ? and articulos.componente_id = componentes.id)", "%#{query}%", "%#{filter}%")
    else
      joins(:articulo).where("inventarios.fecha_ingreso =  ? and nombre like ? and exists (select 1 from componentes where codigo like ? and articulos.componente_id = componentes.id)", "#{datefilter}", "%#{query}%", "%#{filter}%")
    end
  end

  def user_name
     user.try(:name)
  end 


  validates_presence_of :tienda_id, :fecha_ingreso, :moneda, :articulo_id, :cantidad_integer, :valor_unidad
end
