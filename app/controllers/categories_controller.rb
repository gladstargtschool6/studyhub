class CategoriesController < ApplicationController
   
    def show
        @category = Category.find(params[:id])
    end
    def create
        @category = Category.new(category_params)
        @category.name = params[:category][:name]
        @category.save
        redirect_to category_path(@category)
    end

    private 
    def category_params
       params.permit(:name)         
    end
end
