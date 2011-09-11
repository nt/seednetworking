class Event < ActiveRecord::Base
  has_many :projects
  has_many :participations
end
