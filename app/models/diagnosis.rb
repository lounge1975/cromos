# -*- coding: utf-8 -*-
class Diagnosis

  include DataMapper::Resource

  property :id, Serial

  property :name, String
  property :description, Text

  property :created_at, DateTime
  property :updated_at, DateTime

  has n, :interviews, :through => Resource

end
