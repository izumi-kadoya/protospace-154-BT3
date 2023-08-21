class PrototypesController < ApplicationController
  # def restricted_action
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end
  before_action :authenticate_user!, only: [:edit, :update]

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

  def edit
    @prototype = Prototype.find(params[:id])  
  end  
  
  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
       redirect_to  prototype_path(@prototype)    
    else
      render :edit
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
  end
  

  private

  def prototype_params
    params.require(:prototype).permit(:protoname, :catchcopy, :concept, :image).merge(user_id: current_user.id)
  end
end
