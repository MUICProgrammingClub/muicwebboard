# == Schema Information
#
# Table name: user_roles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  role_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :role

  def admin?
    self.role.name == "admin"
  end

  def moderator?
    self.role.name == "moderator"
  end

  def member?
    self.role.name == "member"
  end
end
