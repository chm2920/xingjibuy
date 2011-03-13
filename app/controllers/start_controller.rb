class StartController < ApplicationController
  
  def index
    @deal = Deal.first
  end
  
end
