class RecipesController < ApplicationController
  # GET /recipes
  # GET /recipes.xml

respond_to :html, :atom, :js

before_filter :only => [:index, :tags] do
  @tags = Recipe.tag_counts  # for tag clouds
end
  def index
    @recipes = Recipe.search(params[:search]).order("created_at desc")
   #@tags = Recipe.tag_counts
   respond_with @recipes
  end
def tags
  @recipes = Recipe.tagged_with(params[:name])
  render 'index'
end
  # GET /recipes/1
  # GET /recipes/1.xml
  def show
    @recipe = Recipe.find(params[:id])
    respond_with(@recipe)
  end

  # GET /recipes/new
  # GET /recipes/new.xml
  def new
    @recipe = Recipe.new
    respond_with(@recipe)
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # POST /recipes
  # POST /recipes.xml
  def create
    @recipe = Recipe.new(params[:recipe])
  if @recipe.save
    redirect_to recipes_path, :notice => 'Przepis dodany pomyślnie.'
  else
    render 'new'
  end

  end

  # PUT /recipes/1
  # PUT /recipes/1.xml
  def update
    @recipe = Recipe.find(params[:id])
  if @recipe.update_attributes(params[:recipe])
    redirect_to recipes_path, :notice => 'Przepis poprawiony pomyślnie.'
  else
    render 'edit'
  end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.xml
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    respond_with(@recipe)
    
  end
  
   def rate
    @recipe = Recipe.find(params[:id])
    @recipe.rate(params[:stars], current_user)
    redirect_to @recipe
   end
end