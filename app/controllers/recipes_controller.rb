class RecipesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
    
  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
        flash[:success] = "Recipe created!"
        redirect_to community_url
    else
        render 'static_pages/home'
    end
  end

  def destroy
    @recipe.destroy
    flash[:success] = "Your recipe has been deleted"
    redirect_to request.referrer || root_url
  end
  
  private

  def recipe_params
    params.require(:recipe).permit(:ingredients, :method)
  end
  
  def correct_user
    @recipe = current_user.recipes.find_by(id: params[:id])
    redirect_to root_url if @recipe.nil?
  end
end
