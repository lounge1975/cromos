class CreateInterviews < ActiveRecord::Migration
  def self.up
    create_table :interviews do |t|
      t.integer :disp_no
      t.string :note

      t.timestamps
    end
  end

  def self.down
    drop_table :interviews
  end
end
