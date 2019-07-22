class IdeasController < ApplicationController
    before_action :find_id, only: [:show, :destroy, :edit, :update]

    def new
        @idea = Idea.new
    end

    def create
        @idea = Idea.new idea_params
        if @idea.save
            redirect_to @idea, notice: "New idea submitted!"
        else
            render :new, alert: "Unable to create a new idea!"
        end
    end

    def index
        @ideas = Idea.order(created_at: :desc)
    end

    def show
        @review = Review.new
        @reviews = @idea.reviews.all.order(created_at: :desc)
    end
    
    def destroy
        @idea.destroy
        redirect_to ideas_path, notice: "Idea deleted!"
    end
    
    def edit
    end
    
    def update
        if @idea.update idea_params
            redirect_to @idea, notice: "Idea Updated!"
        else
            redirect_to ideas_path, alert: "Unable to update your idea. Try again!"
        end
    end

    private

    def idea_params
        params.require(:idea).permit(:title, :description)
    end

    def find_id
        @idea = Idea.find params[:id]
    end
end
