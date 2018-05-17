class QuestionsController < ApplicationController
    before_action :redirect_if_not_signed_in
    # def index
    #     @category = Category.find(params[:category_id])
        
    # end
    def create #doesn't work
        @category = Category.find(params[:category_id]) # finding the parent 
    
        @question = @category.questions.build(question_params)
        
        if @question.save
            redirect_to category_path(@category)
        else
            render :new 
        end
    end
    def new
        @category = Category.find(params[:category_id]) # finding the parent 
        # byebug
        @question = @category.questions.new
        # redirect_to category_path(@category)
    end
    
    def edit
        @category = Category.find(params[:category_id])
        @question = @category.questions.find(params[:id]) 
    end
    def show
       @question = Question.find(params[:id]) 
    end
    def update # params are perfect but doesn't update
        # raise params.inspect
        @category = Category.find(params[:category_id]) # finding the parent 
        @question = @category.questions.find(params[:id])
        @question.update_attributes(question_params)
        redirect_to category_question_path(@category)
    end
    def destroy # work good
        @question = Question.find(params[:id])
        @question.destroy
        redirect_to category_path(@question.category)
    end

    private 
    def question_params #the problem is here
        params.require(:question).permit(:title, :content)
    end
    
end