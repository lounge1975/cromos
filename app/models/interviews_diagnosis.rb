class InterviewsDiagnosis < ActiveRecord::Base
  belongs_to :interview
  belongs_to :diagnosis
end
