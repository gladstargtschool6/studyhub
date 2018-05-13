class PagesController < ApplicationController
    def index
       @categories = Category.limit(5) 
    end
end
