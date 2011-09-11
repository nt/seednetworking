class Participation < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  
  validates_presence_of :description
  validates_presence_of :user
  validates_presence_of :event
  validates_presence_of :seeking
end
