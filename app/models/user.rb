class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  before_create :set_default_role

  has_many :topics
  has_many :posts
  
  validates_confirmation_of :password
  validates_presence_of :password, on: :create
  validates_presence_of :username
  #validates_presence_of :email

  ROLES = %w[admin member banned]
  def is?(_role); role == _role.to_s;  end
  def admin?;     role == "admin";     end
  def member?;    role == "member";    end
  def banned?;    role == "banned";    end

  def to_s
    username
  end

  def latest_topic; self.topics.last; end
  def latest_post; self.posts.last; end 

  private

  def set_default_role
    self.role = "member"
  end
end
