class PostsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    posts = Post.all
    render json: posts
  end

  def show
    post = Post.find_by(id: params[:id])
    if post
      render json: post
    else 
      render json: { errors: "Post not found" }
    end
  end

  private

  def render_not_found_response
    render json: { error: "Post not found" }, status: :not_found
  end

end
