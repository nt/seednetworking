class Project < ActiveRecord::Base
  acts_as_votable
  
  belongs_to :event
  belongs_to :user
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :user
  validates_presence_of :event
  validates_presence_of :seeking
  
end
