class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    alias_action :create, :read, to: :read_and_create
    alias_action :update, :read, to: :read_and_update
    alias_action :create, :read, :update, to: :read_create_and_update
    #   user ||= User.new # guest user (not logged in)
    if user.has_role?("admin")
      can :manage, :all

    elsif user.has_role?("teacher")
      can :manage, [Event, Stage, Subject, Grade, StudentContact]
      #can :read_create_and_update, [Grade]
      #can :read_and_update, Institution, id: user.institution_ids

    else #administrative_unit
      can :read, [Grade, Event]
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
