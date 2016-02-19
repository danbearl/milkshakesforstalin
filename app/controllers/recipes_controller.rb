class RecipesController < ApplicationController
  before_filter :require_user, only: [:new, :create, :edit, :update, :destroy]

  expose(:recipes) {Recipe.paginate(page: params[:page], per_page: 10).order('created_at DESC')}
  expose(:recipe)

  def new
    recipe.ingredients.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to :root, notice: "Recipe successfully created."
    else
      render :new
    end
  end

  def update
    if recipe.update_attributes(recipe_params)
      redirect_to recipe, notice: "Recipe successfully updated."
    else
      render :new
    end
  end

  def destroy
    recipe.destroy
    redirect_to recipes_path, notice: "Recipe successfully deleted."
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :instructions, ingredients_attributes: [:quantity, :name, :preparation, :_destroy])
  end
end
