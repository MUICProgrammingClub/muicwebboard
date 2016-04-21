# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :text
#  last_name              :text
#  student_id_number      :integer
#  phone_number           :text
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lectures
  has_many :lecture_files
  has_many :reviews
  has_many :user_roles

  after_create :assign_role

  private
    # assign user's role when the user signup
    # The default role is member
    def assign_role
      member_role = Role.find_by(name: "member")
      UserRole.create!(user_id: self.id, role_id: member_role[:id])
    end
  searchkick
  def full_name
  	"#{first_name} #{last_name}"
  end
end
