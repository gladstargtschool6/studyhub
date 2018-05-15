class QuestionsController < ApplicationController
    def index
        

    end
    def create
        @category = Category.find(params[:category_id]) # finding the parent 
        @question = @category.questions.create(question_params)
        redirect_to category_path(@category)
    end

    def edit
        @question = Question.find(params[:id]) 
    end
    def show
       @question = Question.find(params[:id]) 
    end
    private 
    def question_params
        params.require(:question).permit(:title, :content)
    end
    
end
