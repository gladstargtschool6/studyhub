class QuestionsController < ApplicationController
    def create
        @category = Category.find(params[:category_id]) # finding the parent 
        @question = @category.questions.build(question_params)
        @question.save
        redirect_to category_path(@category)
    end

    private 
    def question_params
        params.require(:question).permit(:title, :content)
    end
    
end
