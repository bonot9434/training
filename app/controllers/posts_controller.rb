class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_comment = PostComment.new
    @post_tags = @post.tags
  end

  def index
    @posts = Post.all.order(id: "DESC")
    @tag_rank = Tag.find(PostTag.group(:tag_id).order('count(tag_id) desc').limit(10).pluck(:tag_id))
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # タグを","で区切って配列
    tag_list = params[:post][:name].split(',')
    if @post.save
      @post.save_tag(tag_list)
      redirect_to posts_path(@post)
    else
      render:new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list =@post.tags.pluck(:name).join(',')
  end

  def update
    @post = Post.find(params[:id])
    tag_list=params[:post][:name].split(',')
    if @post.update(post_params)
       @post.save_tag(tag_list)
       redirect_to post_path(@post.id)
    else
      render:edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:body, :image)
  end

end
