# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user (current_user is passed as 'user')
    user ||= User.new # Guest user (not logged in)

    # Define abilities for posts
    can :destroy, Post, user_id: user.id
    can :destroy, Post if user.role == 'admin'

    # Define abilities for comments
    can :destroy, Comment, user_id: user.id
    can :destroy, Comment if user.role == 'admin'
  end
end

end
