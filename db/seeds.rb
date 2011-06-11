# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# user data import
File.open("./db/user.csv") {|f|
  while l = f.gets
    data = l.rstrip.split(',')
    User.create!(:account => data[0],
                 :name => data[1],
                 :customer_code => data[2],
                 :facility_code => data[3],
                 :section => data[4],
                 :position => data[5],
                 :email => data[6],
                 :password => data[7],
                 :password_confirmation => data[7])
  end
}

# interview data import
File.open("./db/interview.csv") {|f|
  while l = f.gets
    data = l.rstrip.split(',')
    Interview.create!(:disp_no => data[0],
                      :note => data[1])
  end
}

# diagnosis data import
File.open("./db/diagnosis.csv") {|f|
  while l = f.gets
    data = l.rstrip.split(',')
    Diagnosis.create!(:name => data[0],
                      :description => data[1])
  end
}

i = Interview.first
d = Diagnosis.first
i.diagnoses.push(d)
d = Diagnosis.last
i.diagnoses.push(d)
i.save
        
p Interview.first.diagnoses
