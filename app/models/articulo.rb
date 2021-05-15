class Articulo < ActiveRecord::Base
  belongs_to :unidad_medida
  belongs_to :componente
  belongs_to :modelo
  belongs_to :user
  has_many   :inventarios

  def unidad_medida_nombre
    unidad_medida.try(:nombre)
  end 

  def unidad_medida_nombre=(nombre)
  	self.unidad_medida = unidad_medida.find_or_create_by_nombre(nombre) if nombre.present?
  end

  def componente_nombre
    componente.try(:nombre)
  end 

  def componente_nombre=(nombre)
  	self.componente = componente.find_or_create_by_nombre(nombre) if nombre.present?
  end

   def modelo_nombre
     modelo.try(:nombre)
  end 

   def user_name
     user.try(:name)
  end 

  def modelo_nombre=(nombre)
    self.modelo = modelo.find_or_create_by_nombre(nombre) if nombre.present?
  end

 validates_presence_of :nombre, :descripcion, :unidad_medida_id, :componente_id, :modelo_id
 validates_uniqueness_of :nombre, :descripcion

  # It returns the articles whose titles contain one or more words that form the query
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("((nombre like :name1 OR descripcion LIKE :name2) AND (user_id == :user_id))", 
          {:name1 => "%#{query}%", :name2 => "%#{query}%", :user_id => "current_user.user_id"}) 
    
  end

  # It returns the articles whose titles contain one or more words that form the query
  def self.filter(query)
    # where(:title, query) -> This would return an exact match of the query
    joins(:componente).where("codigo like ?", "%#{query}%") 
  end

end

