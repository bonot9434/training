class SearchesController < ApplicationController


  def search_tag
    @tag_list = Tag.all.order(name: "ASC")
    @tag = Tag.find(params[:tag_id])
    @tag_posts = @tag.posts
    
  end

end
