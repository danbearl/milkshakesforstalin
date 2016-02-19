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

  def update
    if post.update_attributes(post_params)
      redirect_to post, notice: "Post successfully updated."
    else
      render :edit
    end
  end

  def destroy
    post.destroy
    redirect_to posts_path, notice: "Post successfully deleted."
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
