class Participation < ActiveRecord::Base
  
  SEEKING_OPTIONS = {
    "be_partner" => "Une position d'associe",
    "fulltime_job" => "Un job a plein temps",
    "internship" => "Un stage",
    "contract_job" => "Un contrat de prestation"
  }
  
  belongs_to :event
  belongs_to :user
  
  validates_presence_of :description
  validates_presence_of :user
  validates_presence_of :event
  validates_presence_of :seeking
  
  def seeking
    s = read_attribute(:seeking)
    SEEKING_OPTIONS.has_key?(s) ? I18n.t("seednetworking.participation.seeking_options."+s) : s
  end
  
end
