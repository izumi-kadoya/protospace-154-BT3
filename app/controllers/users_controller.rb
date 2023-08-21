class UsersController < ApplicationController
  def show
    @username = current_user.username
    @profile = current_user.profile
    @job = current_user.job
    @prototypes = Prototype.all
  end
end
