class HomesController < ApplicationController
  
  def top
    @blogs = Blog.all.order(start_time: :asc)
    @blog = Blog.new
  end
  
end
