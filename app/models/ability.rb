class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all
    else
      cannot :create, Evaluation, event: { presenter_id: user.id } # student who created presentation cannot evaluate
    end
  end
end
