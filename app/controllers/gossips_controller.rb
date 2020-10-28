class GossipsController < ApplicationController
  protect_from_forgery with: :exception

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new('title' => params[:title], 'content' => params[:content], user_id: 1)
    if @gossip.save
      flash[:notice]
      redirect_to home_path
    else
      flash[:error]
      puts @gossip.errors.messages
      render 'new'
    end
  end

end
