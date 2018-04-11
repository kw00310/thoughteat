class HomeController < ApplicationController 
    def home
    end
    def foodrecipes
    end
    def fitness
    end 
    def community
        if logged_in?
            @recipe  = current_user.recipes.build
            @feed_items = current_user.feed.paginate(page: params[:page])
        end
    end 
    def contact
    end
    def map
    end
    def calendar
    end
    def recipeupload
        @recipe = current_user.recipes.build
    end
end
