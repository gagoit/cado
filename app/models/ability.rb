class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    
    if user.admin?
      can :access, :rails_admin 
      can :manage, :all

    elsif user.new_record?
      # users can manage themselves
      can :manage, user, :id => user.id
      can :read, :all
    else
      can :read, :all

      can :manage, Post do |post|
        post.user_id = user.id
      end

      can :update, Comment do |comment|
        comment.user_id = user.id
      end

      can :manage, [Comment, Post]

      can [:create], BetScore do |bc|
        bc.match.can_bet_score
      end

      can [:destroy], BetScore do |bc|
        bc.user_id == user.id && bc.match.can_destroy_bet_score
      end
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
