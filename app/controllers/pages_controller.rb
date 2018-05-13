class PagesController < ApplicationController
    def index
       @questions = Question.limit(5) 
    end
end
