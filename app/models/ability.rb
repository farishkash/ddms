class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
    can :manage, :all
    end

    if user.has_role? :user
    cannot :all, User
    end

    if user.has_role? :district

    can :read, School, district_id: user.district.id
    can [:read, :autocomplete_school_school_name],
       School, district_id: user.district.id
       
    can :read, Project, district_id: user.district.id
    can [:read, :autocomplete_project_project_name],
       Project, district_id: user.district.id
       
    can :read, Document, district_id: user.district_id
    cannot :all, District
    cannot :all, User
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
