class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(
      email: params[:email],
      password: params[:password],
      city_id: 1,
      description: params[:description],
      age: params[:age],
      first_name: params[:first_name],
      last_name: params[:last_name]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Utilisateur enregistré !"
      redirect_to home_path
    else
      flash[:alert] = "Erreur dans l'inscription"
      render 'new'
    end
  end

end
