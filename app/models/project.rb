class Project < ActiveRecord::Base
  
  SEEKING_OPTIONS = {
    "partner" => "Un associe",
    "fulltime_worker" => "Un employe plein temps",
    "intern" => "Un stagiare",
    "service_provider" => "Prestataire"
  }
  
  acts_as_votable
  
  belongs_to :event
  belongs_to :user
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :user
  validates_presence_of :event
  validates_presence_of :seeking
  
  def seeking
    s = read_attribute(:seeking)
    SEEKING_OPTIONS.has_key?(s) ? I18n.t("seednetworking.project.seeking_options."+s) : s
  end
  
end
