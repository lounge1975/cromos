# -*- coding: utf-8 -*-
class MenuController < ApplicationController
  def index
  end

  def interviews
    @type = params[:type]
    @interviews = Interview.all
  end

  def interviews_to_result
    @type = params[:type]
    @interviews = Interview.all
  end

end
