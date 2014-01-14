class Ability
  include CanCan::Ability

  def initialize(user)
	user ||= User.new # guest user (not logged in)
    if user.has_role? :Owner	
      can [:update], User
	  can [:read],:all	 
	elsif user.has_role? :Accountant
		can [:create],[Account,Transaction]
		can [:read,:update], Account,:user_id => user.id		
		can [:update,:read,:receipt], Transaction, :from => { :user => {:id => user.id} }				
		can :read,:totals	
	elsif user.has_role? :DataEntry
		can :create ,[Account,Transaction]
		can [:read,:update], Account , :AccountType_id => 4
		can [:read,:update], Transaction ,:from => { :AccountType_id => 4 },:to => { :AccountType_id => 4 }		
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
