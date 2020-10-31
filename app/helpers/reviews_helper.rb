module ReviewsHelper
    def new_display_header
        if @review.anime
            "Make a review for #{@review.anime.title}"
        else
            "New Review!"
        end
    end

    
end
