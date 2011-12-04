class CreateInterviewsDiagnoses < ActiveRecord::Migration
  def self.up
    create_table :interviews_diagnoses do |t|
      t.references :interview, null: false
      t.references :diagnosis, null: false

      t.timestamps
    end
  end

  def self.down
    drop_table :interviews_diagnoses
  end
end
