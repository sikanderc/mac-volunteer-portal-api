class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: [:update, :destroy, :comment_create, :comment_index]
  skip_before_action :authorized, only: [:index]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    render json: @posts, status: 200
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: 201
    else
      render json: { message: "Please make sure to fill all required fields." }, status: 401
    end
  end

  # POST /posts/1/comments
  # POST /posts/1/comments.json
  def comment_create
    @comment = Comment.new(content: params[:content], user_id: current_user.id, post_id: @post.id)
    if @comment.save
      render json: @comment, status: 201
    else
      render json: { message: "Please make sure to fill all required fields." }, status: 401
    end
  end

  # GET /posts/1/comments
  # GET /posts/1/comments.json
  def comment_index
    @comments = Comment.where(post_id: @post.id)
    render json: @comments, status: 200
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      render json: @post, status: 201
    else
      render json: { message: "Error. Error. Please try again."}, status: 400
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @comments = Comment.where(post_id: @post.id)
    @post.destroy
    @comments.destroy
    render json: { head: :no_content }
  end

  # DELETE /posts/1/comments/1
  # DELETE /posts/1/comments/1.json
  def comment_destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render json: { head: :no_content }
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :event_id, :user_id, :approved)
  end

end
