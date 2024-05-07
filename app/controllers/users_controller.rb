class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :update]

  attr_accessor :first_name, :last_name, :description, :email, :password, :password_confirmation, :current_password

  def show
    # Assure que seul l'utilisateur concerné peut accéder à sa page de profil
    unless current_user == @user
      redirect_to root_path, alert: "Accès non autorisé."
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)

    if @user.update(user_params)
      flash[:success] = "Vos informations ont été mises à jour avec succès !"
      redirect_to user_path(current_user)
    else
      flash[:error] = "Erreur lors de la mise à jour de vos données. Veuillez vérifier les informations."
      redirect_to user_path(current_user)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :email, :password, :password_confirmation, :current_password)
  end
end
