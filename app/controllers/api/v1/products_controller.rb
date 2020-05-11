class Api::V1::ProductsController < ApplicationController
    def index
     @array  = Product.all
    end
end
