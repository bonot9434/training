class SearchesController < ApplicationController

  def search
    @model=params[:model]
    @content=params[:content]
    if @model == 'user'
      @records = User.where('name LIKE ?', '%'+@content+'%')
    elsif @model == 'give'
      @records = User.where('give LIKE ?', '%'+@content+'%')
    else @model == 'take'
      @records = User.where('take LIKE ?', '%'+@content+'%')
    end
  end

  def search_tag
    @tag_list = Tag.all.order(name: "ASC")
    @tag = Tag.find(params[:tag_id])
    @tag_posts = @tag.posts
  end

end
