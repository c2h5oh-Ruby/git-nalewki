class CommentsController < ApplicationController
  before_filter do
    @recipe = Recipe.find params[:recipe_id]
  end

  def new
   respond_with @comment
  end

  def create
    @comment = @recipe.comments.new params[:comment]
    @comment.save
    respond_with(@recipe)
  end
 

  def destroy
    @comment = @recipe.comments.find params[:id]
    @comment.destroy
   respond_with(@recipe)
  end
end