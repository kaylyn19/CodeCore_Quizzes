class ReviewsController < ApplicationController
    def create    
        @idea = Idea.find params[:idea_id]
        @review = Review.new review_params
        @review.idea = @idea
        if @review.save
            redirect_to idea_path(@review.idea_id), notice: "Thank you for the review!"
        else
            render 'ideas/show', alert: "Unable to create a review! Try again."
        end
    end

    def destroy
        @review = Review.find params[:id]
        @review.destroy
        redirect_to idea_path(@review.idea_id), notice: "Review deleted!"
    end

    private

    def review_params
        params.require(:review).permit(:body)
    end

end
