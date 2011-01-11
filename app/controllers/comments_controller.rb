class CommentsController < ApplicationController
  before_filter do
    @fortune = Fortune.find params[:fortune_id]
  end

  def new
    respond_with @comment
  end

  def create
    @comment = @fortune.comments.new params[:comment]
    @comment.save
    respond_with @comment, :location => fortunes_url
  end

  def destroy
    @comment = @fortune.comments.find params[:id]
    @comment.destroy
    respond_with @fortune
  end
end
