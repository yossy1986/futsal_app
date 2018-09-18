class PostsController < ApplicationController
  
  PER = 5
  def index
    @posts = Post.page(params[:page]).per(PER).order(created_at: :desc)
  end

  def show
    @posts = Post.all.order(created_at: :desc)
    @post = Post.find_by(id: params[:id])
  end
  
  def new
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end
  
  def create
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
    @posts = Post.all.order(created_at: :desc)
    @post = Post.find_by(id: params[:id])
  end
  
  def update
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
