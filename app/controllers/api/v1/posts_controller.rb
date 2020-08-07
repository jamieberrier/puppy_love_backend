class Api::V1::PostsController < ApplicationController

  def index
    posts = Post.all
    render json: PostSerializer.new(posts)
    # options = { include: [:breed] }
    # render json: PostSerializer.new(posts, options)
  end

  def create
    post = Post.new(post_params)

    if post.save
      # render json: post, status: :accepted
      render json: PostSerializer.new(post), status: :created
    else
      render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    post = Post.find(params[:post][:id])

    if post.update(num_of_likes: params[:post][:num_of_likes])
      render json: PostSerializer.new(post), status: :ok
    else
      render json: { errors: post.errors.full_messages }, status: :internal_server_error
    end
  end

  private

  def post_params
    params.require(:post).permit(:breed_id, :num_of_likes, :picture)
  end
end
