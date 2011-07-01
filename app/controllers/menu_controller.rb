# -*- coding: utf-8 -*-
class MenuController < ApplicationController
  def index
  end

  def interviews
    @type = params[:type]
    @interviews = Interview.all
  end

  def interviews_to_result
    ids = []
    params[:interviews].each do |k, v|
      ids.push(v.to_i)
    end
    @type = params[:type]
    @interviews = Interview.all(:id => ids)
  end

end
