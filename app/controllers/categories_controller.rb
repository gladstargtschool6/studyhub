class CategoriesController < ApplicationController
    before_action :redirect_if_not_signed_in

    def index
       @categories = Category.all.order("created_at DESC")
       if params[:search]
        @categories = Category.search(params[:search]).order("created_at DESC")
       else
        respond_to do |format|
            format.html {render :index}
            format.json {render json: @categories, include: ['questions']}
        end
       end
    end

    def create # working good
        @category = Category.new(category_params)
        @category.name = params[:category][:name]
        if @category.save
            redirect_to categories_path
        else
            render :new
        end
    end
    def new
        @category = Category.new
        # respond_to do |format|
            # format.html {
                redirect_to @category
            # }
            # format.json {render json: @category, layout: false}
        # end
    end
    def edit
        @category = Category.find(params[:id])
        respond_to do |format|
            format.html {render :edit}
            format.json {render json: @category}
        end
    end
    def show
        @category = Category.find(params[:id])
        respond_to do |format|
            format.html {render :show}
            format.json {render json: @category, include: ['questions']}
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
