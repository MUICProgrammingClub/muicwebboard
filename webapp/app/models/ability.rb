class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    # In case user has more than 1 role, select order by desc
    user_role = UserRole.where(user_id: user.id).order(:role_id).first

    if user_role.nil? # if guest user
      can :read, [Course, Instructor, User, Major]
      can :index, [Lecture, Review]
    else
      if user_role.admin?
        can :manage, :all
      elsif user_role.moderator?
        can :read, [Course, Instructor, User, Lecture, Review, Major]
        can :create, [User, Lecture, Review]

        can :update, Lecture do |lecture|
          lecture.user == user
        end

        can :delete, Lecture do |lecture|
          lecture.user == user
        end

        can :update, Review do |review|
          review.user == user
        end

        can :delete, Review do |review|
          review.user == user
        end

      elsif user_role.member?
        can :read, [Course, Instructor, User, Lecture, Review, Major]
        can :create, [Lecture, Review]

        can :update, Lecture do |lecture|
          lecture.user == user
        end

        can :delete, Lecture do |lecture|
          lecture.user == user
        end

        can :update, Review do |review|
          review.user == user
        end

        can :delete, Review do |review|
          review.user == user
        end

      end

    end
  end
end
