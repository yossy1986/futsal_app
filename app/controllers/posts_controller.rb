class PostsController < ApplicationController
      before_action :authenticate_team,{only:[:new,:create,:edit,:update,:destroy]}

  
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
    @post = Post.new(image: "default_post_image",
                      title: params[:post][:title],
                      content: params[:post][:content])
    if params[:post][:image]
      @post.image = "post#{@post.id}.jpg"
      image = params[:post][:image]
      File.binwrite("public/post_images/#{@post.image}",image.read)
    end
    @post.save
    redirect_to action: 'index'
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
    if params[:post][:image]
    @post.image = "post#{@post.id}.jpg"
    image = params[:post][:image]
    File.binwrite("public/post_images/#{@post.image}",image.read)
    end
    if @post.save
    redirect_to action: 'index'
    else
    render("posts/edit")
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to action: 'index'
  end
end
