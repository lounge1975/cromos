# -*- coding: utf-8 -*-
class Interview

  include DataMapper::Resource

  property :id, Serial

  property :disp_no, Integer, :unique => true, :default => 0
  property :note, String

  property :created_at, DateTime
  property :updated_at, DateTime

  has n, :diagnoses, :through => Resource

  before(:create) do
    self.disp_no = Interview.max(:disp_no).to_i + 1
  end

end
