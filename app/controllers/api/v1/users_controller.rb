class Api::V1::UsersController < ApplicationController
    def show
     @item  = User.find(params[:id])
    end
end
