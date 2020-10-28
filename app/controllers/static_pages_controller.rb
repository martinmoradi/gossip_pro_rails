class StaticPagesController < ApplicationController
  def home
  end

  def welcome
    @name = params[:name]
  end
  
  def gossip
    @gossip_id = params[:gossip_id]
  end

  def author
    @author_id = params[:author_id]
  end

end
