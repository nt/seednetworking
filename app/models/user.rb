class User < ActiveRecord::Base
  acts_as_voter
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
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
