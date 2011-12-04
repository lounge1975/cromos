# -*- coding: utf-8 -*-
class MenuController < ApplicationController
  def index
  end

  def interviews
    @type = params[:type]
    @interviews = Interview.all
  end

  def interviews_to_result
p ["params", params]
    ids = []
    params[:interviews].each do |k, v|
      ids.push(v.to_i)
    end
    @type = params[:type]
p ["ids", ids]
    @interviews = Interview.find(ids)
  end

end
