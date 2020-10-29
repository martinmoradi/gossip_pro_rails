class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :show]

  def new
    @gossip = Gossip.new
  end

  def index
    @gossips = Gossip.all
  end

  def create
    @gossip = Gossip.new('title' => params[:title], 'content' => params[:content], user_id: current_user[:id])
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
    if current_user.id == @gossip.user.id
      @gossip = Gossip.find(params[:id])
    else
      redirect_to(gossip_path(params[:id]), notice: "Tu dois en être l'auteur du potin !")
    end
  end

  def update
    @gossip = Gossip.find(params[:id])
    if current_user.id == @gossip.user.id
      @gossip = Gossip.find(params[:id])
      if @gossip.update(title: params[:title], content: params[:content])
        redirect_to(home_path, notice: 'Gossip modifié!')
      else
        render :edit
      end
    else
     redirect_to(gossip_path(params[:id]), notice: "Tu dois en être l'auteur du potin !")
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    if current_user.id == @gossip.user.id
      @gossip = Gossip.find(params[:id])
      @gossip.destroy
      redirect_to(home_path, notice: 'Gossip supprimé!')
    else
      redirect_to(gossip_path(params[:id]), notice: "Tu dois en être l'auteur du potin !")
    end
  end

  def authenticate_user
    unless current_user
      redirect_to(new_session_path, notice: 'Vous devez être connecté')
    end
  end

end
