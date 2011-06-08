# -*- coding: utf-8 -*-
class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to :user_root
      return
    end
  end
end
