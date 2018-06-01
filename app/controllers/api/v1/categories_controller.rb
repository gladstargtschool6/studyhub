class Api::V1::CategoriesController < ApplicationController
    before_action :redirect_if_not_signed_in

    def index
       @categories = Category.all
       if params[:search]
        @categories = Category.search(params[:search]).order("created_at DESC")
       else
        @categories = Category.all
       end
        # respond_to do |format|
            # format.html {render :show}
            # format.json { render json: @categories}
        # end
       render json: @categories, status: 200
    end
    def create # working good
        @category = Category.new(category_params)
        @category.name = params[:category][:name]
        if @category.save
            redirect_to category_path(@category)
        else
            @categories = Category.all
            render :new
        end
    end
    def new
        @category = Category.new
    end
    def edit
        @category = Category.find(params[:id])
    end
    def show
        @category = Category.find(params[:id])
        respond_to do |format|
            format.html {render :show}
            format.json {render json: @category}
        end
    end
    def update # now work
        # raise params.inspect
        @category = Category.find(params[:id])  
        @category.update_attributes(category_params)
        redirect_to category_path(@category)
    end
    def destroy #  work
        @category = Category.find(params[:id])
        @category.destroy
        # raise params.inspect
        redirect_to new_category_path(@category)
    end
    

    private 
    def category_params
       params.require(:category).permit(:name)         
    end
end
