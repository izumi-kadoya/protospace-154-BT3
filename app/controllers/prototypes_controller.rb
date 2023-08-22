class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: :destroy
  before_action :ensure_correct_user, only: :destroy

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to '/'
    else
      render '/prototypes/new', status: :unprocessable_entity
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    params.require(:prototype).permit(:protoname, :catchcopy, :concept, :image).merge(user_id: current_user.id)
  end

  def ensure_correct_user
    @prototype = Prototype.find(params[:id])
    return if current_user == @prototype.user

    redirect_to root_path
  end
end
