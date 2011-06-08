# -*- coding: utf-8 -*-
class User

  include DataMapper::Resource
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  property :id, Serial

  property :account, String
  property :name, String
  property :customer_code, String
  property :facility_code, String
  property :section, String
  property :position, String
  property :email, String
  property :mobile_phone, String

  property :created_at, DateTime
  property :updated_at, DateTime

end
