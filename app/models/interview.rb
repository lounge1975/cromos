# -*- coding: utf-8 -*-
class Interview < ActiveRecord::Base
#  has_and_belongs_to__many :diagnos
  has_many :interviews_diagnoses
  has_many :diagnoses, :through => :interviews_diagnoses

#  before(:create) do
#    self.disp_no = Interview.maximum(:disp_no).to_i + 1
#  end
end
