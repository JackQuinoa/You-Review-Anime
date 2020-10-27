class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index 
        if params[:anime_id] && @anime = Anime.find_by_id(params[:anime_id])
            @reviews = @anime.reviews 
        else 
            @reviews = Review.all 
        end

    end

end
