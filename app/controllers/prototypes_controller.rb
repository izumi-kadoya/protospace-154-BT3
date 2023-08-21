class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.all
  end

  def prototype_params
    params.require(:prototype).permit(:protoname, :catchcopy, :concept, :image).merge(user_id: current_user.id)
  end

end
