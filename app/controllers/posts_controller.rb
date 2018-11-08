class PostsController < ApplicationController
  before_action :authenticate_team,:admin_team,{only:[:new,:create,:edit,:update,:destroy]}

  
  PER = 5
  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(PER)
    @popular = Post.where(id: [1,3,5,6])
  end

  def show
    @post = Post.find_by(id: params[:id])
    @popular = Post.where(id: [1,3,5,6])
  end
  
  def new
    @post = Post.new
    @popular = Post.where(id: [1,3,5,6])
  end
  
  def create
    @popular = Post.where(id: [1,3,5,6])
    @post = Post.new(image: params[:post][:image],
                      title: params[:post][:title],
                      content: params[:post][:content])
    if @post.save
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end
  
  def edit
    @popular = Post.where(id: [1,3,5,6])
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @popular = Post.where(id: [1,3,5,6])
    @post = Post.find_by(id: params[:id])
    @post.title = params[:post][:title]
    @post.content = params[:post][:content]
    @post.image = params[:post][:image]
    if @post.save
    redirect_to action: 'index'
    else
    render action: 'edit'
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to action: 'index'
  end
end
