class CategoriesController < ApplicationController
    def show
        @category = Category.find(params[:id])
    end
    def new
        
    end

    private 
    def category_params
       params.permit(:name)         
    end
end
