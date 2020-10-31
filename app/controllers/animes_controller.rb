class AnimesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new 
        @anime = Anime.new
    end

    def create
        @anime = Anime.new(anime_params)
        if @anime.save
            redirect_to animes_path
        else
            redirect_to new_anime_path
            flash[:error] = "Don't leave blank space and make sure this title doesn't already exist!"
        end
    end

    def index
        @animes = Anime.all
    end

    def show 
        @anime = Anime.find_by_id(params[:id])
        redirect_to animes_path if !@anime
    end

    def most_reviewed
        @animes = Anime.all
        @sorted = @animes.sort_by{ |a| a.reviews.count }
    end


    private 

    def anime_params
        params.require(:anime).permit(:title)
    end

end
