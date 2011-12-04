# -*- coding: utf-8 -*-
class Diagnosis < ActiveRecord::Base
#  has_and_belongs_to__many :interviews
  has_many :interviews_diagnoses
  has_many :interviews, :through => :interviews_diagnoses
end
