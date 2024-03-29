class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new # guest user (not logged in)

    if user.role == 'admin'
      can :manage, :all
      can :assign_roles, User
      can :download_counters, Fossil

    elsif user.role == 'normal'
      can :read, Collection, :id =>  user.collection_ids
      can :read, Collection, :public => true
      
      
      cannot :manage, Fossil
      can :download, Fossil, :collection => {:id => user.collection_ids  }
      can :download, Fossil, :collection => {:public => true }
      can :new, Fossil do |fossil|
        !user.collection_user_joins.can_upload.empty? 
      end
      can [:create, :show], Fossil do |fossil|
        user.can_upload_collections.include?(fossil.collection)
      end
      cannot :download_counters, Fossil

      
      cannot :manage, User
      can :manage, User, :id => user.id

      
    else  # non logged in user
      can :read, Collection, :public => true
      can :download, Fossil, :collection => { :public => true }
      cannot :manage, User
      
    end
    
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
