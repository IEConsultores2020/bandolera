class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      # user ||= User.new # guest user (not logged in)
       if user.admin?
          can :manage, :all
       elsif user.seller?
          can :read, Articulo 
          can :read, Componente
          can :read, Empresa
          can :read, Inventario
          can :read, Modelo
          can :read, Tienda
          can :read, UnidadMedida
          can :read, Inscrito

          can :create, Articulo
          can :create, Componente
          can :create, Empresa
          can :create, Inventario
          can :create, Modelo
          can :create, Tienda
          can :create, UnidadMedida

          can :update, Articulo do |articulo|
            Articulo.try(:user) == user
          end

          can :update, Componente do |componente|
            Componente.try(:user) == user
          end


          can :destroy, Articulo do |articulo|
            Articulo.try(:user) == user
          end

          can :destroy, Componente do |componente|
            Componente.try(:user) == user
          end

        elsif user.regular?
          
          can :show, Empresa do |empresa|
            Empresa.try(:user) == user
          end          

          can :read, Articulo
          can :read, Componente
          can :read, Inventario
          can :read, Modelo
          can :read, Tienda
          can :read, UnidadMedida
          can :read, Inscrito
          can :read, User          
          can :read, Empresa do |empresa|
            Empresa.try(:user) == user
          end

          can :update, Empresa do |empresa|
            Empresa.try(:user) == user
          end


          can :create, Inscrito

          can :create, Empresa
         
         elsif user.owner?         
          can :read, Property
          can :update, Property
          can :create, Property
          can :delete, Property
          can :destroy, Property
          can :read, HomeOwnerAdministrator
          can :update, HomeOwnerAdministrator
          can :create, HomeOwnerAdministrator
          can :delete, HomeOwnerAdministrator
          can :destroy, HomeOwnerAdministrator
          can :read, Appliance
          can :update, Appliance
          can :create, Appliance
          can :delete, Appliance
          can :destroy, Appliance
          can :read, Gadget
          can :update, Gadget
          can :create, Gadget
          can :delete, Gadget
          can :destroy, Gadget
          can :read, Tenant
          can :update, Tenant
          can :create, Tenant
          can :delete, Tenant
          can :destroy, Tenant
          
          
        end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
