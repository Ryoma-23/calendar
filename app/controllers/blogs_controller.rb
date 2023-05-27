class BlogsController < ApplicationController
  
  def create
    @blog = Blog.new(blog_parameter)
    if @blog.save
      redirect_to root_path(@blog.id), notice: "予定を追加しました"
    else
      redirect_to root_path, notice: "予定を追加できませんでした"
    end
  end
  
  def show
    @blog = Blog.find(params[:id])
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to root_path, notice: "削除しました"
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end
  
  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_parameter)
      redirect_to blog_path, notice: "編集しました"
    else
      redirect_to blog_path, notice: "編集できませんでした"
    end
  end
  
  private
  
  def blog_parameter
    params.require(:blog).permit(:title, :content, :start_time)
  end
  
end
