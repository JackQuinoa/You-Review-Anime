class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index 
        if params[:anime_id] && @anime = Anime.find_by_id(params[:anime_id])
            @reviews = @anime.reviews 
        else 
            @reviews = Review.all 
        end

    end

    def new
        if params[:anime_id] && @anime = Anime.find_by_id(params[:anime_id])
            @review = @anime.reviews.build
        else
            @review = Review.new 
        end
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to reviews_path
        else 
            binding.pry
            render :new 
        end
    end

    private 

    def review_params
        params.require(:review).permit(:rating, :content, :anime_id)
    end

end
