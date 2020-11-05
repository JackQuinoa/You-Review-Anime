class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_review, only: [:edit, :update]

    def index 
        if check_anime
            @reviews = @anime.reviews 
        elsif check_user
            @reviews = current_user.reviews
        else
            @reviews = Review.all 
        end

    end

    def new
        if check_anime
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
            render :new 
        end
    end

    def edit
    end

    def update 
        if @review.update(review_params)
            redirect_to review_path(@review)
        else
            render :edit
        end
    end

    def destroy
        set_review
        @review.delete
        redirect_to review_path(current_user.reviews)
    end

    def newest_reviews
        @reviews = Review.newest_reviews
    end

    private 

    def review_params
        params.require(:review).permit(:rating, :content, :anime_id)
    end

    def set_review
        @review = Review.find_by_id(params[:id])
        redirect_to reviews_path if !@review || @review.user != current_user
    end

    def check_user
        params[:user_id] && @user = User.find_by_id(params[:user_id])
    end

    def check_anime
        params[:anime_id] && @anime = Anime.find_by_id(params[:anime_id])
    end


end
