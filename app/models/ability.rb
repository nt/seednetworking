class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)

    can :signup_project, Event do |e|
      !user.participating?(e) and e.accepts_new_projects
    end
    
    can :signup_self, Event do |e|
      !user.participating?(e) and e.accepts_new_participants
    end
    
    can :read, :all
    
    can [:update, :edit], Project, user_id: user.id
    
    can :vote, Project do |p|
      user.participating_as_competence_holder?(p.event) and !user.voted_for?(p)
    end
    
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
