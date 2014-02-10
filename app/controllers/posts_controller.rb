class PostsController < ApplicationController
  before_action :signed_in_user, except: :show
  before_action :correct_user, only: [:edit, :update, :destroy]
  def show
  	@post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = current_user.posts.build(post_params)
  	if @post.save
  	  flash[:success] = "Post published."
  	  redirect_to @post
  	else
  	  render 'new'
  	end
  end

  def edit
  end

  def update
  	if @post.update(post_params)
  	  flash[:success] = "Post updated."
  	  redirect_to @post
  	else
  	  render 'edit'
  	end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post destroyed."
    redirect_to posts_user_url(current_user)
  end

  private

    def post_params
      params.require(:post).permit(:title, :text)
    end

    def correct_user
      @post = current_user.posts.find(params[:id])
      redirect_to root_url if @post.nil?
    end
end
