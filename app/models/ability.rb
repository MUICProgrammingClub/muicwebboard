class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    # In case user has more than 1 role, select order by desc
    user_role = UserRole.where(user_id: user.id).order(:role_id).first

    if user_role.nil? # if guest user

    else

    end
  end
end
