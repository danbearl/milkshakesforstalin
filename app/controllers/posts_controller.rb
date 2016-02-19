class PostsController < ApplicationController
  expose(:posts)
  expose(:post)

  def create
    new_post = Post.new(post_params)
    if new_post.save
      redirect_to root_path, notice: "Post successfully created."
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
