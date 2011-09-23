class AddInvitationStatusFlagsToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.boolean :accepts_new_projects, default: true
      t.boolean :accepts_new_participants, default: true
    end
    Event.update_all ["accepts_new_projects = ? and accepts_new_participations = ?", true, true]
  end

  def self.down
  end
end
