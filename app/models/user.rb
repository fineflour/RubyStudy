class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :user_roles
  has_many :user_roles, :dependent => :destroy
  has_and_belongs_to_many :roles, :through => :user_roles

  ROLES = Role.select('name, id')
  ADMIN_ROLE = "Administrator"
  after_initialize :set_default_role, :if => :new_record?

  #========SCOPE===========================================================

  #========================================================================

  def get_role

  end

  def set_default_role
    self.role ||= :user
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
    self.roles.pluck(:name).include?ADMIN_ROLE
  end
end
