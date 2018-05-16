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
    def create
        @category = Category.new(category_params)
        @category.name = params[:category][:name]
        @category.save
        redirect_to category_path(@category)
    end
    def new
        @category = Category.new(category_params)
    end
    def edit
        @category = Category.find(params[:id])
    end
    def show
        @category = Category.find(params[:id])
    end
    def update
        # raise params.inspect
        @category = Category.find(params[:id])  
        @category.update_attributes(category_params)
        redirect_to category_path(@category)
    end
    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to category_path(@category)
    end
    

    private 
    def category_params
       params.permit(:name)         
    end
end
