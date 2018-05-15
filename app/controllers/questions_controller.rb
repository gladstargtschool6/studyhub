class QuestionsController < ApplicationController
    def index
        @category = Category.find(params[:category_id])
        
    end
    def create
        @category = Category.find(params[:category_id]) # finding the parent 
        @question = @category.questions.create(question_params)
        redirect_to category_path(@category)
    end
    
    def edit
        @category = Category.find(params[:category_id])
        @question = @category.questions.find(params[:id]) 
    end
    def show
       @question = Question.find(params[:id]) 
    end
    def update
        @category = Category.find(params[:category_id]) # finding the parent 
        @question = @category.questions.find(params[:id])
        @question.update_attributes(question_params)
        redirect_to category_path(@category)
    end
    def destroy
    #     @category = Category.find(params[:category_id])
        @question = Question.find(params[:id])
        @question.destroy
        redirect_to category_path(@question.category)
    end

    private 
    def question_params
        params.require(:question).permit(:title, :content)
    end
    
end
