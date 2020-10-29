class GossipsController < ApplicationController
  protect_from_forgery with: :exception

  def new
    @gossip = Gossip.new
  end

  def index
    @gossips = Gossip.all
  end

  def create
    @gossip = Gossip.new('title' => params[:title], 'content' => params[:content], user_id: 1)
    if @gossip.save
      flash[:notice] = "Potin enregistré !"
      redirect_to home_path
    else
      flash[:alert] = "Erreur, le potin n'a pas été enregistré"
      puts @gossip.errors.messages
      render 'new'
    end
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(title: params[:title], content: params[:content])
      redirect_to(home_path, notice: 'Gossip modifié!')
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to(home_path, notice: 'Gossip supprimé!')
  end


end
