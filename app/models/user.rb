class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
    :recoverable, :rememberable, :trackable, :validatable #:registerable,
  has_many :user_roles
  has_many :user_roles, :dependent => :destroy
  has_many :roles, :through => :user_roles
  #attr_accessor :login

  ROLES = Role.select('name, id')
  ADMIN_ROLE = "System Admin"
  after_initialize :set_default_role, :if => :new_record?
  before_create :set_default_role, :set_active

  #========SCOPE===========================================================

  #========================================================================

  def role
    self.roles.map(&:name).first
  end

  def role_id
    self.roles.map(&:id).first
  end


  def set_default_role
    self.roles.name ||= Role.find_by_name"User" 
  end

def set_active
    self.active ||= 1
  end



  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:reset_password_token)
    self.reset_apssword_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def admin?
    self.roles.pluck(:name).include? ADMIN_ROLE
  end
end
