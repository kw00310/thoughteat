class RelationshipsController < ApplicationController
    before_action :logged_in_user

    def create
        @user = User.find(params[:connoisseur_id])
        current_user.follow(@user)
    end    

    def destroy
        @user = Relationship.find(params[:id]).connoisseur
        current_user.unfollow(@user)
    end    
end
