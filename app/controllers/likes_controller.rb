class LikesController < ApplicationController
  before_action :authenticate_user! # Ensure user authentication

  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.build(post: @post)

    if @like.save
      redirect_to @post, notice: 'Post liked.'
    else
      redirect_to @post, alert: 'Error liking the post.'
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @post = @like.post

    if @like.destroy
      redirect_to @post, notice: 'Post unliked.'
    else
      redirect_to @post, alert: 'Error unliking the post.'
    end
  end
end
