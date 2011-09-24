class AddInvitationStatusFlagsToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.boolean :accepts_new_projects, default: true
      t.boolean :accepts_new_participants, default: true
    end
    Event.all.each do |e|
      e.accepts_new_projects = true
      e.accepts_new_participants = true
      e.save
    end
  end

  def self.down
  end
end
