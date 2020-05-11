class Api::V1::ArticlesController < ApplicationController
    def show
     @item  = Article.find(params[:id])
    end

    def index
     @array  = Article.all
    end
end
