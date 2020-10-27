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
            render :new 
        end
    end

    private 

    def anime_params
        params.require(:anime).permit(:title)
    end

end
