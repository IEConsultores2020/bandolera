class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :rememberable,
  devise :database_authenticatable, :registerable,
         :recoverable,  :trackable, :validatable
  belongs_to :role
  has_many :articulos
  has_many :modelos
  has_many :empresas
  has_many :inventarios
  has_many :componentes
  has_many :tiendas
  has_many :unidad_medidas
  has_many :inscritos

  validates_presence_of :name
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: "owner" if self.role.nil?
  end
  
  def owner?
    self.role.name == "owner"
  end

  def admin?
    self.role.name == "Admin"
  end

  def seller?
    self.role.name == "Seller"
  end

  def regular?
    self.role.name == "Regular"
  end

  def empresa_demo
     Empresa.find_by nombre: 'DEMO'
  end

end
