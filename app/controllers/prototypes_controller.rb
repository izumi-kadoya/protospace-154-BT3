class PrototypesController < ApplicationController
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
end
