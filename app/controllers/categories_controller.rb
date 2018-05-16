class CategoriesController < ApplicationController
    def index
       @categories = Category.all
       if params[:search]
        @categories = Category.search(params[:search]).order("created_at DESC")
       else
        @categories = Category.all
       end
    #    render :action => 'index'
    end
    def show
        @category = Category.find(params[:id])
        # @question = @category.questions.build
    end
    def create
        @category = Category.new(category_params)
        @category.name = params[:category][:name]
        @category.save
        redirect_to category_path(@category)
    end
    def new
        @category = Category.new(category_params)
    end
    

    private 
    def category_params
       params.permit(:name)         
    end
end
