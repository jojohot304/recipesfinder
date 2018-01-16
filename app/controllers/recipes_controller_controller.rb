class RecipesControllerController < ApplicationController
  def index
	@search_term = params[:search] || 'chocolate'
	@Recipes = Recipe.for(@search_term)
  end
end
