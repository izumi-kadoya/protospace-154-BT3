class PrototypesController < ApplicationController
  def new
   @prototype = Prototype.new
  end
  def create
    Prototype.create(prototype_params)
    redirect_to '/' # ルートURLにリダイレクト
  end
end

private

  def prototype_params
   params.require(:prototype).permit(:protoname, :catchcopy, :concept, :image).merge(user_id: current_user.id)
  end