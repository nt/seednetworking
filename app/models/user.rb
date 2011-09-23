class User < ActiveRecord::Base
  acts_as_voter
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :telephone, :email, :password, :password_confirmation, :remember_me
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :telephone
  validates_presence_of :email
  
  
  has_many :projects
  has_many :participations
  
  def participating?(e)
     participating_as_project_holder?(e) or participating_as_competence_holder?(e)
  end
  
  def participating_as_project_holder?(e)
    !Project.where(event_id: e.id, user_id: self.id).first.nil?
  end
  
  def participating_as_competence_holder?(e)
    !Participation.where(event_id: e.id, user_id: self.id).first.nil?
  end
  
end
