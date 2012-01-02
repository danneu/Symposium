class User < ActiveRecord::Base
  authenticates_with_sorcery!

  ROLES = %w[admin member banned]
  before_create :set_default_role

  validates_confirmation_of :password
  validates_presence_of :password, on: :create
  validates_presence_of :username
  validates_presence_of :email

  def is?(_role); role == _role.to_s;  end
  def admin?;     role == "admin";     end
  def member?;    role == "member";    end
  def banned?;    role == "banned";    end

  private

  def set_default_role
    self.role = "member"
  end
end
