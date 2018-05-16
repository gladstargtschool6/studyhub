class PagesController < ApplicationController
    def index
       @categories = Category.all
        if params[:search]
        @categories = Category.search(params[:search]).order("created_at DESC")
       else
        @categories = Category.all
       end
    end
   
end
