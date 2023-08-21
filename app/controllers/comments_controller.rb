class CommentsController < ApplicationController
  def create
    Comment = Comment.create(comment_params)
 redirect_to “/prototypes/#{prototype.tweet.id}"  
end

  private
  def comment_params
    params.require(:comment).permit(:string).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end